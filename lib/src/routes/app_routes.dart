import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';

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
      initialLocation: '/login',
      routerNeglect: true,
      routes: [
        GoRoute(
          path: '/',
          name: Routes.home.name,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'detail',
              name: Routes.detail.name,
              builder: (context, state) {
                final extras = state.extra as Extras;
                final id = extras.datas[ExtrasKey.id] as int;
                return DetailMoviePage(id: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/register',
          name: Routes.register.name,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/login',
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
