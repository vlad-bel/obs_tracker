import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:obs_tracker/core/app_config/app_config.dart';
import 'package:obs_tracker/core/failures/failures.dart';
import 'package:obs_websocket/obs_websocket.dart';

class ObsWebsocketDatasource {
  final AppConfig appConfig;
  ObsWebSocket? _obsWebSocket;

  bool _isConnecting = false;

  ObsWebsocketDatasource({required this.appConfig});

  Future<Either<Failure, ObsWebSocket>> getClient() async {
    try {
      final status = await _obsWebSocket!.stream.getStreamStatus();

      if (_obsWebSocket != null && status.outputActive) {
        return Right(_obsWebSocket!);
      }

      if (_obsWebSocket != null) {
        await _obsWebSocket!.close();
      }

      final client = await ObsWebSocket.connect(
        appConfig.obsWebSocketUrl,
        password: appConfig.obsWebSocketPassword,
      );

      _obsWebSocket = client;

      client.onDone!(() {
        _obsWebSocket = null;
      });

      return Right(_obsWebSocket!);
    } on SocketException catch (e) {
      _obsWebSocket = null;
      return Left(ObsFailure(e.port, "Неудалось подключиться к сокету", e));
    } catch (e) {
      return Left(UnexpectedFailure("Неожиданная ошибка", e));
    }
  }
}
