import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:obs_tracker/feature/obs/domain/obs_repository.dart';
import 'package:obs_websocket/obs_websocket.dart';

class ObsRepositoryImpl implements ObsRepository {
  final ObsWebSocket _obs;

  const ObsRepositoryImpl({required ObsWebSocket obs}) : _obs = obs;

  @override
  Future<String> getCurrentRecordFilePath() async {
    final dirResp =
        await _obs.sendRequest(Request("GetRecordDirectory")) as RecordDirectoryResponse;

    return dirResp.recordDirectory;
  }

  @override
  Future<Duration> getCurrentRecordPosition() async {
    final status = await _obs.sendRequest(Request("GetRecordStatus")) as RecordStatusResponse;

    final ms = status.outputDuration;

    return Duration(milliseconds: ms);
  }

  @override
  Future<Uint8List> takeScreenshot() async {
    final response = await _obs.sendRequest(
      Request(
        "GetSourceScreenshot",
        requestData: {
          "sourceName": "source",
          "imageFormat": "png",
        },
      ),
    );

    final base64Image = (response as SourceScreenshotResponse).imageData;

    return base64Decode(base64Image);
  }
}

