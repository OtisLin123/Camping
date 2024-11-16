import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/feature/camping_list/presentation/camping_list_page.dart';
import 'package:camping/feature/campsite/presentation/camping_site_page.dart';
import 'package:camping/feature/resource_declaration/presentation/resource_declaration_page.dart';
import 'package:camping/feature/setting/presentation/setting_page.dart';
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
    GoRoute(
      path: '/resourceDeclarationPage',
      name: 'resourceDeclarationPage',
      builder: (context, state) => const ResourceDeclarationPage(),
    ),
    GoRoute(
      path: '/settingPage',
      name: 'settingPage',
      builder: (context, state) => const SettingPage(),
    ),
    GoRoute(
      path: '/campingSitePage',
      name: 'campingSitePage',
      builder: (context, state) => CampingSitePage(
        data: state.extra as CampingSite?,
      ),
    ),
  ],
  redirect: (context, GoRouterState state) {
    debugPrint('router matchedLocation ${state.matchedLocation}');

    return null;
  },
);
