import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';

class TopBarDetailSection extends ConsumerWidget {
  const TopBarDetailSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailMovieControllerProvider);
    final favoriteController =
        ref.read(favoriteMovieControllerProvider.notifier);
    final controller = ref.read(detailMovieControllerProvider.notifier);
    return PaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: ColorApp.white,
              size: SizeApp.h40,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.toggleFavoriteMovie();
              favoriteController.getFavoriteMovies();
            },
            child: Icon(
              state.isMovieFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: ColorApp.white,
              size: SizeApp.h28,
            ),
          ),
        ],
      ),
    );
  }
}
