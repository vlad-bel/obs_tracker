import 'package:obs_tracker/feature/episodes/data/datasources/episodes_datasource.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/domain/repositories/episodes_repository.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesLocalDataSource dataSource;

  const EpisodesRepositoryImpl({required this.dataSource});

  @override
  Future<Episode> createEpisode(Episode episode) async {
    final episodes = await dataSource.getEpisodes();
    episodes.add(episode);

    await dataSource.saveEpisodes(episodes);

    return episode;
  }

  @override
  Future<List<Episode>> getEpisodes() async {
    return dataSource.getEpisodes();
  }
}
