// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EpisodeEpidorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EpisodeEpidorPage(),
      );
    },
    EpisodePlayerRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodePlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EpisodePlayerPage(
          key: args.key,
          episode: args.episode,
        ),
      );
    },
    EpisodesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EpisodesListPage(),
      );
    },
  };
}

/// generated route for
/// [EpisodeEpidorPage]
class EpisodeEpidorRoute extends PageRouteInfo<void> {
  const EpisodeEpidorRoute({List<PageRouteInfo>? children})
      : super(
          EpisodeEpidorRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeEpidorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EpisodePlayerPage]
class EpisodePlayerRoute extends PageRouteInfo<EpisodePlayerRouteArgs> {
  EpisodePlayerRoute({
    Key? key,
    required Episode episode,
    List<PageRouteInfo>? children,
  }) : super(
          EpisodePlayerRoute.name,
          args: EpisodePlayerRouteArgs(
            key: key,
            episode: episode,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodePlayerRoute';

  static const PageInfo<EpisodePlayerRouteArgs> page =
      PageInfo<EpisodePlayerRouteArgs>(name);
}

class EpisodePlayerRouteArgs {
  const EpisodePlayerRouteArgs({
    this.key,
    required this.episode,
  });

  final Key? key;

  final Episode episode;

  @override
  String toString() {
    return 'EpisodePlayerRouteArgs{key: $key, episode: $episode}';
  }
}

/// generated route for
/// [EpisodesListPage]
class EpisodesListRoute extends PageRouteInfo<void> {
  const EpisodesListRoute({List<PageRouteInfo>? children})
      : super(
          EpisodesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
