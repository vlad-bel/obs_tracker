
import 'package:flutter/foundation.dart';

abstract interface class ObsRepository {
  Future<Duration> getCurrentRecordPosition();

  Future<String> getCurrentRecordFilePath();

  Future<Uint8List> takeScreenshot();
}
