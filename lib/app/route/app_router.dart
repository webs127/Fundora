import 'package:flutter/material.dart';
import 'package:fundora/app/route/route_constants.dart';
import 'package:fundora/feature/allocate/presentation/allocate.dart';
import 'package:fundora/feature/categories/presentation/categories.dart';
import 'package:fundora/feature/history/presentation/history.dart';
import 'package:fundora/feature/home/presentation/home.dart';
import 'package:fundora/navigation/app_navigation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;
  //static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteConstants.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.home,
                builder: (context, state) => HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.allocate,
                builder: (context, state) => AllocatePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.categories,
                builder: (context, state) => CategoriesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.history,
                builder: (context, state) => HistoryPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
