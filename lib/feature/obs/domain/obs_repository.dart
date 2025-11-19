
import 'package:flutter/foundation.dart';
import 'package:obs_websocket/obs_websocket.dart';

abstract interface class ObsRepository {

  Future<Duration> getCurrentRecordPosition();

  Future<String> getCurrentRecordFilePath();


  Future<String> saveReplayAndGetPath();

  Future<Uint8List> takeScreenshot();
}
