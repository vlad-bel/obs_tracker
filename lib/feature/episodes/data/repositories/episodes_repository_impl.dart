import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:obs_tracker/core/failures/failures.dart';
import 'package:obs_tracker/feature/episodes/data/datasources/episodes_datasource.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/domain/repositories/episodes_repository.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesLocalDataSource dataSource;

  const EpisodesRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Episode>> createEpisode(Episode episode) async {
    try {
      final episodes = await dataSource.getEpisodes();
      episodes.add(episode);

      await dataSource.saveEpisodes(episodes);
      return Right(episode);
    } on FileSystemException catch (e) {
      return Left(StorageFailure("Error of saving file", e));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error", e));
    }
  }

  @override
  Future<Either<Failure, List<Episode>>> getEpisodes() async {
    try {
      final episodes = await dataSource.getEpisodes();

      return Right(episodes);
    } on FormatException catch (e) {
      return Left(StorageFailure("Incorrect file format", e));
    } on FileSystemException catch (e) {
      return Left(StorageFailure("Access to file denied", e));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error", e));
    }
  }
}
