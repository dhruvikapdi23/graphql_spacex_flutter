import 'dart:developer';

import 'package:graphql_spacex_flutter/features/launch_detail/presentation/pages/launch_detail_page.dart';
import 'package:graphql_spacex_flutter/features/rockets_detail/presentation/pages/rockets_detail_page.dart';
import 'package:graphql_spacex_flutter/features/rockets/presentation/pages/rockets_page.dart';
import 'package:graphql_spacex_flutter/features/launches/presentation/pages/launches_page.dart';
import 'package:graphql_spacex_flutter/features/splash/presentation/pages/splash_page.dart';
import 'package:graphql_spacex_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_spacex_flutter/features/upcoming_launches/pages/upcoming_launches.dart';
import 'app_routes.dart';


final router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: GlobalNavigation.instance.navigatorKey,
  routes: [
    GoRoute(
      name: Names.rocketsDetail,
      path: Routes.rocketsDetail,
      builder: (context, state) {

        return const RocketDetailPage();
      },
    ),

    GoRoute(
      name: Names.rockets,
      path: Routes.rockets,
      builder: (context, state) => const RocketsPage(),
    ),

    GoRoute(
      name: Names.launches,
      path: Routes.launches,
      builder: (context, state) => const LaunchesPage(),
    ),

    GoRoute(
      name: Names.splash,
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      name: Names.dashboard,
      path: Routes.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),

    GoRoute(
      name: Names.launchDetail,
      path: Routes.launchDetail,
      builder: (context, state) => const LaunchDetailPage(),
    ),
    GoRoute(
      name: Names.upComing,
      path: Routes.upComing,
      builder: (context, state) => const UpcomingLaunchCountView(),
    ),

  ],
);

class GlobalNavigation {
  static final GlobalNavigation instance = GlobalNavigation._internal();
  GlobalNavigation._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

