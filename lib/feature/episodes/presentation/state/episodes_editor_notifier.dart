import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
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

  Future<void> loadScreenshot() async {
    _isLoading = true;
    notifyListeners();

    final screenshot = await obsRepository.takeScreenshot();
    _backgroundBytes = screenshot;

    notifyListeners();
  }

  Future<Episode> saveEpisode({
    Duration pre = const Duration(seconds: 5),
    Duration post = const Duration(seconds: 5),
  }) async {
    _isSaving = true;
    notifyListeners();

    final currentPos = await obsRepository.getCurrentRecordPosition();
    final videoPath = await obsRepository.getCurrentRecordFilePath();

    final jsonList = drawingController.getJsonList();
    final drawingJson = jsonEncode(jsonList);

    final imageData = await drawingController.getImageData();
    final pngBytes = imageData?.buffer.asUint8List();
    /// todo add error handling
    final screenShotPath = await _saveScreenshotPng(pngBytes!);

    final result = await episodesNotifier.addEpisode(CreateEpisodeParams(
      videoPath: videoPath,
      currentPosition: currentPos,
      preDuration: pre,
      postDuration: post,
      screenshotPath: screenShotPath,
      drawingJson: drawingJson,
    ));

    _isSaving = false;
    notifyListeners();

    return result;
  }

  Future<String> _saveScreenshotPng(Uint8List bytes) async {
    final dir = getApplicationDocumentsDirectory();
    final file = File("$dir/screenshot_${DateTime.now().millisecondsSinceEpoch}.png");

    await file.writeAsBytes(bytes);

    return file.path;
  }
}
