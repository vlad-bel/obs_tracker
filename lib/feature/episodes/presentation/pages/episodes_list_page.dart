import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obs_tracker/core/navigation/app_router.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EpisodesListPage extends StatefulWidget {
  const EpisodesListPage({super.key});

  @override
  State<EpisodesListPage> createState() => _EpisodesListPageState();
}

class _EpisodesListPageState extends State<EpisodesListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EpisodesNotifier>().loadEpisodes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EpisodesNotifier>(
      builder: (context, notifier, child) {
        if (notifier.isLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Episodes"),
          ),
          body: notifier.isLoading
              ? Center(child: CircularProgressIndicator())
              : notifier.episodes.isEmpty
                  ? Center(
                      child: Text("No episodes"),
                    )
                  : ListView.builder(
                      itemCount: notifier.episodes.length,
                      itemBuilder: (context, index) {
                        final episode = notifier.episodes[index];

                        return ListTile(
                          leading: Image.file(
                            File(episode.screenshotPath),
                            width: 64,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                              "Episode ${index + 1} - ${episode.startOffset.inSeconds}-${episode.endOffset.inSeconds} s"),
                          subtitle: Text(episode.videoPath),
                          onTap: () {
                            ///todo go to player page
                            context.router.push(EpisodePlayerRoute(episode: episode));
                          },
                        );
                      },
                    ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              ///todo goto edit page
              context.router.push(EpisodeEpidorRoute());
            },
          ),
        );
      },
    );
  }
}
