import 'package:dartz/dartz.dart';
import 'package:obs_tracker/core/failures/failures.dart';

abstract interface class UseCase<T, P> {
  Future<Either<Failure, T>> call(P p);
}

class NoParams {
  const NoParams();
}
