import 'package:flutter/material.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/features/presentation.dart';

class RelatedMoviesSection extends StatelessWidget {
  const RelatedMoviesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleMoreSection(
          title: 'Terkait',
          onMoreTap: () {},
        ),
        Gap.h20,
        MovieListSection(
          movieItems: [
            dummyMovie,
            dummyMovie,
            dummyMovie,
            dummyMovie,
            dummyMovie,
            dummyMovie,
          ],
        ),
        Gap.h40,
      ],
    );
  }
}
