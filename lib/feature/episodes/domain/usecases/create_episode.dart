import 'package:obs_tracker/core/usecase/usecase.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/domain/repositories/episodes_repository.dart';
import 'package:uuid/uuid.dart';

class CreateEpisodeParams {
  final String videoPath;
  final Duration currentPosition;
  final Duration preDuration;
  final Duration postDuration;
  final String screenshotPath;
  final String drawingJson;

  CreateEpisodeParams({
    required this.videoPath,
    required this.currentPosition,
    required this.preDuration,
    required this.postDuration,
    required this.screenshotPath,
    required this.drawingJson,
  });
}

class CreateEpisodeUsecase implements UseCase<Episode, CreateEpisodeParams> {
  final EpisodesRepository repository;
  final _uuid = const Uuid();

  const CreateEpisodeUsecase(this.repository);

  @override
  Future<Episode> call(CreateEpisodeParams p) {
    final start = p.currentPosition - p.preDuration;
    final end = p.currentPosition + p.postDuration;

    final episode = Episode(
      id: _uuid.v4(),
      videoPath: p.videoPath,
      startOffset: start.isNegative ? Duration.zero : start,
      endOffset: end,
      screenshotPath: p.screenshotPath,
      drawingJson: p.drawingJson,
      createdAt: DateTime.now(),
    );

    return repository.createEpisode(episode);
  }
}
