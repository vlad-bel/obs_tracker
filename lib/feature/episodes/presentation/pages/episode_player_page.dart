import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_player_notifier.dart';
import 'package:provider/provider.dart';

class EpisodePlayerPage extends StatefulWidget {
  final Episode episode;

  const EpisodePlayerPage({
    super.key,
    required this.episode,
  });

  @override
  State<EpisodePlayerPage> createState() => _EpisodePlayerPageState();
}

class _EpisodePlayerPageState extends State<EpisodePlayerPage> {
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
                child: Image.file(
                  File(notifier.episode.screenshotPath),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
