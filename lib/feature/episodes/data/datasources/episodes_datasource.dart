import 'dart:convert';
import 'dart:io';

import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class EpisodesLocalDataSource {
  Future<List<Episode>> getEpisodes();

  Future<void> saveEpisodes(List<Episode> episodes);
}

class EpisodesLocalDataSourceImpl implements EpisodesLocalDataSource {
  static const _fileName = "episodes.json";

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();

    return File("${dir.path}/$_fileName");
  }

  @override
  Future<List<Episode>> getEpisodes() async {
    final file = await _getFile();

    if (!file.existsSync()) {
      return [];
    }

    final content = await file.readAsString();

    if (content.isEmpty) {
      return [];
    }

    final list = jsonDecode(content) as List;

    return list.map((e) => Episode.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> saveEpisodes(List<Episode> episodes) async {
    final file = await _getFile();

    final jsonList = episodes.map((e)=> e.toJson()).toList();

    await file.writeAsString(jsonEncode(jsonList));
  }
}
