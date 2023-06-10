import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/gen/assets.gen.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';

class TopBarSection extends ConsumerWidget {
  const TopBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Gap.w8,
          GestureDetector(
            onTap: () {
              controller.logout();
              context.goNamed(Routes.login.name);
            },
            child: Assets.icons.icMyflixM.svg(
              height: SizeApp.h32,
              fit: BoxFit.fitHeight,
            ),
          ),
          Gap.w8,
          Text(
            'Series',
            style: TypographyApp.headline3,
          ),
          Gap.w8,
          Text(
            'Movies',
            style: TypographyApp.headline3,
          ),
          Gap.w8,
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.favorite.name);
            },
            child: Text(
              'My List',
              style: TypographyApp.headline3,
            ),
          ),
          Gap.w8,
          Icon(
            Icons.search_rounded,
            color: ColorApp.white,
            size: SizeApp.h24,
          ),
          Gap.w8,
        ],
      ),
    );
  }
}
