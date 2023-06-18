import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';

class RelatedMoviesSection extends ConsumerWidget {
  const RelatedMoviesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailMovieControllerProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleMoreSection(
          title: 'Terkait',
          onMoreTap: () {},
        ),
        Gap.h20,
        AsyncValueWidget(
          value: state.movieListValue,
          data: (data) {
            return MovieListSection(
              movieItems: state.movieList,
            );
          },
        ),
        Gap.h40,
      ],
    );
  }
}
