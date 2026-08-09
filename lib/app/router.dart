import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/route_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/navigation/app_bottom_nav_bar.dart';
import '../features/home/presentation/views/home_view.dart';
import '../features/library/presentation/views/library_view.dart';
import '../features/network/presentation/views/network_view.dart';
import '../features/search/presentation/views/resource_details_view.dart';
import '../features/search/presentation/views/search_results_view.dart';
import '../features/search/presentation/views/search_view.dart';
import '../features/settings/presentation/views/settings_view.dart';
import '../features/splash/presentation/views/splash_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// Riverpod provider delivering the configured [GoRouter] instance.
final Provider<GoRouter> routerProvider = Provider<GoRouter>((Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splashPath,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      // Splash Route (Root Navigator)
      GoRoute(
        path: AppRoutes.splashPath,
        name: AppRoutes.splashName,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) => const SplashView(),
      ),

      // Resource Details Fullscreen Route (Root Navigator)
      GoRoute(
        path: AppRoutes.resourceDetailsPath,
        name: AppRoutes.resourceDetailsName,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const ResourceDetailsView(),
      ),

      // Main Navigation Shell with 5 Persistent Tabs
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: navigationShell,
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
            ),
          );
        },
        branches: <StatefulShellBranch>[
          // Branch 0: Home
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.homePath,
                name: AppRoutes.homeName,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeView(),
              ),
            ],
          ),

          // Branch 1: Library
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.libraryPath,
                name: AppRoutes.libraryName,
                builder: (BuildContext context, GoRouterState state) =>
                    const LibraryView(),
              ),
            ],
          ),

          // Branch 2: Center Search Action
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.searchPath,
                name: AppRoutes.searchName,
                builder: (BuildContext context, GoRouterState state) =>
                    const SearchView(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'results',
                    name: AppRoutes.searchResultsName,
                    builder: (BuildContext context, GoRouterState state) =>
                        const SearchResultsView(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 3: Network
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.networkPath,
                name: AppRoutes.networkName,
                builder: (BuildContext context, GoRouterState state) =>
                    const NetworkView(),
              ),
            ],
          ),

          // Branch 4: Settings
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.settingsPath,
                name: AppRoutes.settingsName,
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingsView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
