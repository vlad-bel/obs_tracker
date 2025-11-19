sealed class Failure {
  final String message;
  final Object? cause;

  const Failure(
    this.message, [
    this.cause,
  ]);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message, [super.cause]);
}

class VideoFailure extends Failure {
  const VideoFailure(super.message, [super.cause]);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message, [super.cause]);
}

class ObsFailure extends Failure {
  final int? code;

  const ObsFailure(
    this.code,
    super.message,
    super.cause,
  );
}

String mapFailureToMessage(Failure failure) {
  switch (failure) {
    case StorageFailure():
      return "File error:${failure.message}";
    case VideoFailure():
      return "Video error:${failure.message}";
    case ObsFailure():
      return "Obs error:${failure.message}";
    case UnexpectedFailure():
      return "Unexpected error:${failure.message}";
  }
}
