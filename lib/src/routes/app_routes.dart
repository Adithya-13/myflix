import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/error_page.dart';

enum Routes {
  splash,
  login,
  register,
  home,
  detail,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      initialLocation: '/',
      routerNeglect: true,
      routes: [
        GoRoute(
          path: '/',
          name: Routes.home.name,
          builder: (context, state) => const HomePage(),
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
