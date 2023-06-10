import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/services/local/local.dart';

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
      urlPathStrategy: UrlPathStrategy.path,
      initialLocation: '/login',
      routerNeglect: true,
      redirect: (state) {
        // if the user is not logged in, they need to login
        final loggedIn = ref.read(hiveServiceProvider).getUser() != null;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) return loggingIn ? null : '/login';

        // if the user is logged in but still on the login page, send them to
        // the home page
        if (loggingIn) return '/home';

        // no need to redirect at all
        return null;
      },
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
