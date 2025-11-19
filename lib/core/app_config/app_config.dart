import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String obsWebSocketUrl;
  final String obsWebSocketPassword;
  final int replyBufferDuration;
  final int prevWindow;
  final int postWindow;

  const AppConfig({
    required this.obsWebSocketUrl,
    required this.obsWebSocketPassword,
    required this.replyBufferDuration,
    required this.prevWindow,
    required this.postWindow,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      obsWebSocketUrl: json["obsWebSocketUrl"],
      obsWebSocketPassword: json["obsWebSocketPassowrd"],
      replyBufferDuration: json["replyBufferDuration"] as int,
      prevWindow: json["prevWindow"] as int,
      postWindow: json["postWindow"] as int,
    );
  }

  static Future<AppConfig> load() async {
    final raw = await rootBundle.loadString("assets/config/app_config.json");
    final map = jsonDecode(raw) as Map<String, dynamic>;

    return AppConfig.fromJson(map);
  }
}
