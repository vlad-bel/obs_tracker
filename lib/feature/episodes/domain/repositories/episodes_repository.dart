import 'package:dartz/dartz.dart';
import 'package:obs_tracker/core/failures/failures.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';

abstract interface class EpisodesRepository {
  Future<Either<Failure, Episode>> createEpisode(Episode episode);

  Future<Either<Failure, List<Episode>>> getEpisodes();
}
