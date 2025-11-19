import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:video_player/video_player.dart';

class EpisodesPlayerNotifier extends ChangeNotifier {
  final Episode episode;

  EpisodesPlayerNotifier({required this.episode}) {
    _init();
  }

  late final VideoPlayerController _playerController;

  VideoPlayerController get playerController => _playerController;

  ChewieController? _chewieController;

  ChewieController? get chewieController => _chewieController;

  bool _isReady = false;

  bool get isReady => _isReady;

  bool _isDisposed = false;

  Future<void> _init() async {
    _playerController = VideoPlayerController.file(File(episode.videoPath));

    await _playerController.initialize();
    await _playerController.seekTo(episode.startOffset);

    playerController.addListener(_positionListener);

    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      autoPlay: true,
      looping: false,
    );

    _isReady = true;

    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void _positionListener() {
    if (!_playerController.value.isInitialized) {
      return;
    }

    final pos = _playerController.value.position;
    if (pos >= episode.endOffset) {
      _playerController.pause();
    }
  }

  @override
  void dispose(){
    _isDisposed = true;
    _playerController.removeListener(_positionListener);
    _playerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
