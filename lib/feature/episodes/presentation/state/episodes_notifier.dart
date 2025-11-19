import 'package:flutter/cupertino.dart';
import 'package:obs_tracker/core/failures/failures.dart';
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

  Failure? _failure;

  Failure? get failure => _failure;

  Future<void> loadEpisodes() async {
    _isLoading = true;
    notifyListeners();

    final res = await getEpisodes(NoParams());
    res.fold(
      (f) {
        _failure = f;
      },
      (data) {
        _episodes = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addEpisode(CreateEpisodeParams params) async {
    final res = await createEpisode(params);
    res.fold(
      (f) {
        _failure = f;
      },
      (data) {
        final episode = data;
        _episodes.add(episode);
      },
    );

    notifyListeners();
  }
}
