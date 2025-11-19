import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';

abstract interface class EpisodesRepository{
  Future<Episode> createEpisode(Episode episode);
  Future<List<Episode>> getEpisodes();
}