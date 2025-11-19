import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_editor_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EpisodeEpidorPage extends StatefulWidget {
  const EpisodeEpidorPage({super.key});

  @override
  State<EpisodeEpidorPage> createState() => _EpisodeEpidorPageState();
}

class _EpisodeEpidorPageState extends State<EpisodeEpidorPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EpisodesEditorNotifier>().loadScreenshot();
    });
  }

  Future<void> _onSavePressed() async {
    final notifier = context.read<EpisodesEditorNotifier>();

    await notifier.saveEpisode();

    notifier.clear();
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EpisodesEditorNotifier>(
      builder: (context, notifier, widget) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            context.read<EpisodesEditorNotifier>().clear();
          },
          child: Scaffold(
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
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return DrawingBoard(
                        controller: notifier.drawingController,
                        background: SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.memory(
                              notifier.backgroundBytes!,
                            ),
                          ),
                        ),
                        showDefaultActions: true,
                        showDefaultTools: true,
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
