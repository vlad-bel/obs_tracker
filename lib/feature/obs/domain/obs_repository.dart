import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obs_tracker/core/failures/failures.dart';

abstract interface class ObsRepository {
  Future<Either<Failure, Duration>> getCurrentRecordPosition();

  Future<Either<Failure, String>> saveReplayAndGetPath();

  Future<Either<Failure, Uint8List>> takeScreenshot();
}
