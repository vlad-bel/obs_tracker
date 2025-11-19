import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:obs_tracker/core/failures/failures.dart';
import 'package:obs_tracker/feature/episodes/domain/usecases/create_episode.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_notifier.dart';
import 'package:obs_tracker/feature/obs/domain/obs_repository.dart';
import 'package:path_provider/path_provider.dart';

class EpisodesEditorNotifier extends ChangeNotifier {
  final ObsRepository obsRepository;
  final EpisodesNotifier episodesNotifier;

  EpisodesEditorNotifier({
    required this.obsRepository,
    required this.episodesNotifier,
  });

  final drawingController = DrawingController();

  Uint8List? _backgroundBytes;

  Uint8List? get backgroundBytes => _backgroundBytes;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isSaving = false;

  bool get isSaving => _isSaving;

  static const replayDuration = Duration(seconds: 60);
  static const preWindow = Duration(seconds: 10);
  static const postWindow = Duration(seconds: 10);

  DateTime? _screenshotTime;

  Failure? _failure;

  Failure? get failure => _failure;

  Future<void> loadScreenshot() async {
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final data = await obsRepository.takeScreenshot();

    data.fold(
      (l) {
        _failure = l;
      },
      (data) {
        _backgroundBytes = data;
        _screenshotTime = DateTime.now();
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> clear() async {
    drawingController.clear();
    _backgroundBytes = null;
    _failure = null;
  }

  Future<void> saveEpisode({
    Duration pre = const Duration(seconds: 5),
    Duration post = const Duration(seconds: 5),
  }) async {
    if (backgroundBytes == null) {
      return;
    }

    _failure = null;
    _isSaving = true;
    notifyListeners();

    final screenShotPath = await _saveDrawPng();

    final drawingJson = jsonEncode(drawingController.getJsonList());

    final data = await obsRepository.saveReplayAndGetPath();

    data.fold(
      (l) {
        _failure = l;
      },
      (data) async {
        final now = DateTime.now();
        final delta = now.difference(_screenshotTime!);
        var screenshotPos = replayDuration - delta;

        if (screenshotPos < Duration.zero) {
          screenshotPos = Duration.zero;
        } else if (screenshotPos > replayDuration) {
          screenshotPos = replayDuration;
        }

        var startOffset = screenshotPos - preWindow;
        var endOffset = screenshotPos + postWindow;

        if (startOffset < Duration.zero) {
          startOffset = Duration.zero;
        }
        if (endOffset > replayDuration) {
          endOffset = replayDuration;
        }

        if (endOffset <= startOffset) {
          endOffset = startOffset + Duration(seconds: 1);
        }

        await episodesNotifier.addEpisode(CreateEpisodeParams(
          videoPath: data,
          preDuration: startOffset,
          postDuration: endOffset,
          screenshotPath: screenShotPath,
          drawingJson: drawingJson,
        ));
      },
    );

    _isSaving = false;
    notifyListeners();
  }

  Future<String> _saveDrawPng() async {
    final imageData = await drawingController.getImageData();
    final bytes = imageData?.buffer.asUint8List();

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png");

    await file.writeAsBytes(bytes!);

    return file.path;
  }
}
