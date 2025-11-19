import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obs_tracker/core/navigation/app_router.dart';
import 'package:obs_tracker/feature/episodes/data/datasources/episodes_datasource.dart';
import 'package:obs_tracker/feature/episodes/data/repositories/episodes_repository_impl.dart';
import 'package:obs_tracker/feature/episodes/domain/usecases/create_episode.dart';
import 'package:obs_tracker/feature/episodes/domain/usecases/get_episodes.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_editor_notifier.dart';
import 'package:obs_tracker/feature/episodes/presentation/state/episodes_notifier.dart';
import 'package:obs_tracker/feature/obs/data/obs_repository_impl.dart';
import 'package:obs_tracker/feature/obs/domain/obs_repository.dart';
import 'package:obs_websocket/obs_websocket.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final obsWebSocket = await ObsWebSocket.connect('ws://127.0.0.1:4455', password: 'myStrongPassword1234@_');

  final episodesDs = EpisodesLocalDataSourceImpl();
  final episodesRepo = EpisodesRepositoryImpl(dataSource: episodesDs);

  final createEpisodesUseCase = CreateEpisodeUsecase(episodesRepo);
  final getEpisodesUseCase = GetEpisodesUseCase(repository: episodesRepo);

  final appRouter = AppRouter();

  runApp(
    MultiProvider(
      providers: [
        Provider<ObsRepository>(
          create: (_) => ObsRepositoryImpl(obs: obsWebSocket),
        ),
        ChangeNotifierProvider(
          create: (_) => EpisodesNotifier(
            createEpisode: createEpisodesUseCase,
            getEpisodes: getEpisodesUseCase,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => EpisodesEditorNotifier(
            obsRepository: context.read<ObsRepository>(),
            episodesNotifier: context.read<EpisodesNotifier>(),
          ),
        ),
      ],
      child: ObsTrackerApp(router: appRouter),
    ),
  );
}

class ObsTrackerApp extends StatelessWidget {
  final AppRouter router;

  const ObsTrackerApp({super.key, required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Obs Tracker',
      theme: ThemeData.dark(),
      routerConfig: router.config(),
    );
  }
}
