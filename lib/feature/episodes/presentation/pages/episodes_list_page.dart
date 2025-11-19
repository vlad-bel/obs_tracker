import 'dart:io';

import 'package:flutter/material.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_notifier.dart';
import 'package:provider/provider.dart';

class EpisodesListPage extends StatefulWidget {
  const EpisodesListPage({super.key});

  @override
  State<EpisodesListPage> createState() => _EpisodesListPageState();
}

class _EpisodesListPageState extends State<EpisodesListPage> {
  @override
  void initState() {
    super.initState();
    context.read<EpisodesNotifier>().loadEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EpisodesNotifier>(
      builder: (context, notifier, child) {
        if (notifier.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Episodes"),
          ),
          body: notifier.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
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
                      },
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              ///todo goto edit page
            },
          ),
        );
      },
    );
  }
}
