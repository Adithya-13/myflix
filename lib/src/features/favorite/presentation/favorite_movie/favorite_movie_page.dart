import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class FavoriteMoviePage extends ConsumerStatefulWidget {
  const FavoriteMoviePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoriteMoviePageState();
}

class _FavoriteMoviePageState extends ConsumerState<FavoriteMoviePage> {
  FavoriteMovieController get controller =>
      ref.read(favoriteMovieControllerProvider.notifier);
  FavoriteMovieState get state => ref.watch(favoriteMovieControllerProvider);

  @override
  void didChangeDependencies() {
    safeRebuild(() {
      controller.getFavoriteMovies();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(builder: (context) {
          if (state.favoriteMovieListValue.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state.isLoading) {
            return const Center(
              child: LoadingWidget(),
            );
          } else if (state.favoriteMovieList.isEmpty) {
            return Center(
              child: Text(
                'You haven\'t Favorites any movie, favorite your movie first',
                style: TypographyApp.headline2,
              ),
            );
          }
          return ListView.builder(
            itemCount: state.favoriteMovieList.length,
            itemBuilder: (context, index) {
              final favoriteMovie = state.favoriteMovieList[index];
              return Text('${favoriteMovie.title} ${favoriteMovie.id}');
            },
          );
        }),
      ),
    );
  }
}

class TopBarFavoriteSection extends StatelessWidget {
  const TopBarFavoriteSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Expanded(
            child: Text('Favorite Movies', style: TypographyApp.headline3),
          ),
        ],
      ),
    );
  }
}
