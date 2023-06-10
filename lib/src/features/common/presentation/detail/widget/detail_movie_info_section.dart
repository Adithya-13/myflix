import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class DetailMovieInfoSection extends ConsumerWidget {
  const DetailMovieInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailMovieControllerProvider);
    final detailMovie = state.movie!;
    return PaddingWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailMovie.title,
            style: TypographyApp.headline2,
          ),
          Gap.h8,
          Text(
            '${detailMovie.releaseDate} • ${detailMovie.filmRate} • ${detailMovie.minutes} Minutes',
            style: TypographyApp.text2.grey,
          ),
          Gap.h16,
          ButtonWidget.primary(
            text: 'Play',
            onTap: () {},
          ),
          Gap.h16,
          Text(
            detailMovie.overview,
            style: TypographyApp.text2,
          ),
          Gap.h16,
          Wrap(
            children: detailMovie.categories
                .map((item) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeApp.w16,
                        vertical: SizeApp.h4,
                      ),
                      margin: EdgeInsets.only(
                        right: SizeApp.w16,
                        bottom: SizeApp.h16,
                      ),
                      decoration: BoxDecoration(
                        color: ColorApp.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        item,
                        style: TypographyApp.text2.darkGrey,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
