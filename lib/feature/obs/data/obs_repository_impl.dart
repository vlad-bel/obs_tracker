import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:obs_tracker/feature/obs/domain/obs_repository.dart';
import 'package:obs_websocket/command.dart';
import 'package:obs_websocket/event.dart';
import 'package:obs_websocket/obs_websocket.dart';

class ObsRepositoryImpl implements ObsRepository {
  final ObsWebSocket obs;

  ObsRepositoryImpl({required this.obs});


  @override
  Future<String> getCurrentRecordFilePath() async {
    final dirResp = await obs.sendRequest(Request("GetRecordStatus"));

    final dir = dirResp?.responseData?["recordDirectory"];

    return dir;
  }

  @override
  Future<Duration> getCurrentRecordPosition() async {
    final status = await obs.sendRequest(Request("GetRecordStatus"));

    final ms = status?.responseData?["outputDuration"] as int;

    return Duration(milliseconds: ms);
  }

  @override
  Future<Uint8List> takeScreenshot() async {
    final currentSceneResp = await obs.sendRequest(
      Request("GetCurrentProgramScene"),
    );

    final response = await obs.sendRequest(
      Request(
        "GetSourceScreenshot",
        requestData: {
          "sourceName":
              currentSceneResp?.responseData?["currentProgramSceneName"] ?? "default scene",
          "imageFormat": "png",
        },
      ),
    );

    var imageData = response?.responseData?["imageData"];

    if (imageData.startsWith('data:')) {
      final commaIndex = imageData.indexOf(',');
      if (commaIndex != -1) {
        imageData = imageData.substring(commaIndex + 1);
      }
    }

    return base64Decode(imageData);
  }

  @override
  Future<String> saveReplayAndGetPath() {
    // TODO: implement saveReplayAndGetPath
    throw UnimplementedError();
  }
}
