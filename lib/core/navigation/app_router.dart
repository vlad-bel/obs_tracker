import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';
import 'package:obs_tracker/feature/episodes/presentation/pages/episode_editor_page.dart';
import 'package:obs_tracker/feature/episodes/presentation/pages/episode_player_page.dart';
import 'package:obs_tracker/feature/episodes/presentation/pages/episodes_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: EpisodesListRoute.page,
          path: "/",
        ),
        AutoRoute(
          page: EpisodeEpidorRoute.page,
          path: "/edit",
        ),
        AutoRoute(
          page: EpisodePlayerRoute.page,
          path: "/player",
        ),
      ];
}
