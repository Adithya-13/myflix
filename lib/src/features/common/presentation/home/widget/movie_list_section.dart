import 'package:flutter/material.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class MovieListSection extends StatelessWidget {
  final List<Movie> movieItems;
  const MovieListSection({
    Key? key,
    required this.movieItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeightPercentage(0.2),
      child: ListView.builder(
        itemCount: movieItems.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: SizeApp.w32, right: SizeApp.w16),
        itemBuilder: (context, index) {
          final movieItem = movieItems[index];
          return MovieItemSection(
            imageUrl: movieItem.imageUrl,
          );
        },
      ),
    );
  }
}
