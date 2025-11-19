import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_editor_notifier.dart';
import 'package:provider/provider.dart';

class EpisodeEpidorPage extends StatefulWidget {
  const EpisodeEpidorPage({super.key});

  @override
  State<EpisodeEpidorPage> createState() => _EpisodeEpidorPageState();
}

class _EpisodeEpidorPageState extends State<EpisodeEpidorPage> {
  @override
  void initState() {
    super.initState();
    context.read<EpisodesEditorNotifier>().loadScreenshot();
  }

  Future<void> _onSavePressed() async {
    final notifier = context.read<EpisodesEditorNotifier>();

    final result = await notifier.saveEpisode();

    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EpisodesEditorNotifier>(
      builder: (context, notifier, widget) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("New Episode"),
            actions: [
              IconButton(
                onPressed: notifier.isSaving ? null : _onSavePressed,
                icon: notifier.isSaving
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(),
                      )
                    : Icon(Icons.save),
              ),
            ],
          ),
          body: notifier.isLoading || notifier.backgroundBytes == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DrawingBoard(
                      controller: notifier.drawingController,
                      background: Image.memory(
                        notifier.backgroundBytes!,
                        fit: BoxFit.cover,
                      ),
                      showDefaultActions: true,
                      showDefaultTools: true,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
