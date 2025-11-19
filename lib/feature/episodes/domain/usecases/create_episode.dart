import 'package:dartz/dartz.dart';
import 'package:obs_tracker/core/failures/failures.dart';
import 'package:obs_tracker/core/usecase/usecase.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/domain/repositories/episodes_repository.dart';
import 'package:uuid/uuid.dart';

class CreateEpisodeParams {
  final String videoPath;
  final String screenshotPath;
  final String drawingJson;
  final Duration preDuration;
  final Duration postDuration;

  CreateEpisodeParams({
    required this.videoPath,
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
  Future<Either<Failure, Episode>> call(CreateEpisodeParams p) {

    final episode = Episode(
      id: _uuid.v4(),
      videoPath: p.videoPath,
      startOffset: p.preDuration,
      endOffset: p.postDuration,
      screenshotPath: p.screenshotPath,
      drawingJson: p.drawingJson,
      createdAt: DateTime.now(),
    );

    return repository.createEpisode(episode);
  }
}
