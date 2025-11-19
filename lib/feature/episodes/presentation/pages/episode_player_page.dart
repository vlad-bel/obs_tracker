import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_player_notifier.dart';
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';

@RoutePage()
class EpisodePlayerPage extends StatelessWidget {
  final Episode episode;

  const EpisodePlayerPage({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EpisodesPlayerNotifier(
        episode: episode,
      ),
      child: _EpisodePlayerView(),
    );
  }
}

class _EpisodePlayerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EpisodesPlayerNotifier>(
      builder: (context, notifier, widget) {
        if (!notifier.isReady || notifier.chewieController == null) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Play episode"),
          ),
          body: Column(
            children: [
              AspectRatio(
                aspectRatio: notifier.playerController.value.aspectRatio,
                child: Chewie(controller: notifier.chewieController!),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: PhotoView(
                  imageProvider: FileImage(
                    File(notifier.episode.screenshotPath),
                  ),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 10,
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
