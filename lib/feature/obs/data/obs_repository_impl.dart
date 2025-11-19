import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obs_tracker/core/failures/failures.dart';
import 'package:obs_tracker/feature/obs/domain/obs_repository.dart';
import 'package:obs_websocket/obs_websocket.dart';

class ObsRepositoryImpl implements ObsRepository {
  final ObsWebSocket obs;

  ObsRepositoryImpl({required this.obs});


  @override
  Future<Either<Failure, Duration>> getCurrentRecordPosition() async {
    try {
      final status = await obs.record.getRecordStatus();

      return Right(Duration(milliseconds: status.outputDuration));
    } on WebSocketException catch (e) {
      return Left(ObsFailure(e.httpStatusCode, "Error of getting status", e));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error", e));
    }
  }

  @override
  Future<Either<Failure, Uint8List>> takeScreenshot() async {
    try {
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

      return Right(base64Decode(imageData));
    } on WebSocketException catch (e) {
      return Left(ObsFailure(e.httpStatusCode, "Error of taking screenshot", e));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error", e));
    }
  }

  @override
  Future<Either<Failure, String>> saveReplayAndGetPath() async {
    try {
      await obs.outputs.saveReplayBuffer("output");

      final resp = await obs.send("GetLastReplayBufferReplay");
      final path = resp?.responseData?["savedReplayPath"] as String;

      return Right(path);
    } on WebSocketException catch (e) {
      return Left(ObsFailure(e.httpStatusCode, "Error of saving reply", e));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error", e));
    }
  }
}
