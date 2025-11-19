import 'package:flutter/cupertino.dart';
import 'package:obs_tracker/core/usecase/usecase.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/domain/usecases/create_episode.dart';
import 'package:obs_tracker/feature/episodes/domain/usecases/get_episodes.dart';

class EpisodesNotifier extends ChangeNotifier {
  final CreateEpisodeUsecase createEpisode;
  final GetEpisodesUseCase getEpisodes;

  EpisodesNotifier({
    required this.createEpisode,
    required this.getEpisodes,
  });

  List<Episode> _episodes = [];

  List<Episode> get episodes => _episodes;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> loadEpisodes() async {
    _isLoading = true;
    notifyListeners();
    _episodes = await getEpisodes(NoParams());
    _isLoading = false;
    notifyListeners();
  }

  Future<Episode> addEpisode(CreateEpisodeParams params) async {
    final episode = await createEpisode(params);
    _episodes.add(episode);
    notifyListeners();
    return episode;
  }
}
