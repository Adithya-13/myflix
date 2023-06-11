import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/services/services.dart';

enum Routes {
  splash,
  login,
  register,
  home,
  detail,
  favorite,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation:
          ref.read(hiveServiceProvider).getUser() != null ? '/home' : '/login',
      routerNeglect: true,
      redirectLimit: 1,
      routes: [
        GoRoute(
          path: '/home',
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
            GoRoute(
              path: 'favorite',
              name: Routes.favorite.name,
              builder: (context, state) => const FavoriteMoviePage(),
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
