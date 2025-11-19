import 'package:dartz/dartz.dart';
import 'package:obs_tracker/core/failures/failures.dart';
import 'package:obs_tracker/core/usecase/usecase.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/domain/repositories/episodes_repository.dart';

class GetEpisodesUseCase implements UseCase<List<Episode>, NoParams> {
  final EpisodesRepository repository;

  GetEpisodesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Episode>>> call(NoParams p) {
    return repository.getEpisodes();
  }
}
