import 'package:camping/feature/camping_list/camping_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootKey');

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: 'campingListPage',
      builder: (context, state) => const CampingListPage(),
    ),
  ],
  redirect: (context, GoRouterState state) {
    debugPrint('router matchedLocation ${state.matchedLocation}');

    return null;
  },
);
