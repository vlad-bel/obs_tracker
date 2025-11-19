import 'package:flutter/foundation.dart';

abstract interface class ObsRepository {

  Future<Duration> getCurrentRecordPosition();

  Future<String> getCurrentRecordFilePath();

  Future<String> saveReplayAndGetPath();

  Future<Uint8List> takeScreenshot();
}
