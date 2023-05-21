import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class HeaderMovieInfoSection extends ConsumerWidget {
  const HeaderMovieInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final headerMovie = state.home!.headerMovie;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // avengers endgame
        Text(
          headerMovie.title,
          style: TypographyApp.headline1,
        ),
        Gap.h20,
        // category, match, minutes
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              headerMovie.getStrCategories,
              style: TypographyApp.headline3,
            ),
            Gap.w20,
            Text(
              '${headerMovie.match.toInt()}% Match',
              style: TypographyApp.headline3.green,
            ),
            Gap.w20,
            Text(
              '${headerMovie.minutes.toInt()} Minutes',
              style: TypographyApp.headline3,
            ),
            Gap.h20,
          ],
        ),
        Gap.h32,
        // mylist, play button, info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_rounded,
                  color: ColorApp.white,
                  size: SizeApp.h32,
                ),
                Gap.h8,
                Text(
                  'My List',
                  style: TypographyApp.text1,
                ),
              ],
            ),
            ButtonWidget.primary(
              text: 'Play',
              onTap: () {},
              prefix: const Icon(
                Icons.play_arrow_rounded,
                color: ColorApp.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.detail.name,
                  extra: Extras(
                    datas: {
                      ExtrasKey.id: headerMovie.id,
                    },
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: ColorApp.white,
                    size: SizeApp.h32,
                  ),
                  Gap.h8,
                  Text(
                    'Info',
                    style: TypographyApp.text1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
