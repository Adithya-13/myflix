import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/common/domain/movie.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';
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
          return Column(
            children: [
              const TopBarFavoriteSection(),
              Gap.h20,
              Expanded(
                child: ListView.builder(
                  itemCount: state.favoriteMovieList.length,
                  padding: EdgeInsets.symmetric(horizontal: SizeApp.w32),
                  itemBuilder: (context, index) {
                    final favoriteMovie = state.favoriteMovieList[index];
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.detail.name,
                          extra: Extras(
                            datas: {
                              ExtrasKey.id: favoriteMovie.id,
                            },
                          ),
                        );
                      },
                      child: FavoriteMovieCardWidget(
                        favoriteMovie: favoriteMovie,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class FavoriteMovieCardWidget extends StatelessWidget {
  const FavoriteMovieCardWidget({
    Key? key,
    required this.favoriteMovie,
  }) : super(key: key);

  final Movie favoriteMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorApp.darkGrey,
      ),
      height: context.screenHeightPercentage(0.2),
      margin: EdgeInsets.only(
        bottom: SizeApp.h16,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: favoriteMovie.imageUrl,
              height: context.screenHeightPercentage(0.2),
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeApp.w8,
                vertical: SizeApp.h12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    favoriteMovie.title,
                    style: TypographyApp.headline3,
                  ),
                  Gap.h12,
                  Text(
                    '${favoriteMovie.minutes.toInt()} minutes',
                    style: TypographyApp.text1,
                  ),
                  Gap.h4,
                  Text(
                    favoriteMovie.releaseDate,
                    style: TypographyApp.text1,
                  ),
                  const Spacer(),
                  Text(
                    '${favoriteMovie.match.toInt()} match',
                    style: TypographyApp.text1.green,
                  ),
                ],
              ),
            ),
          ),
        ],
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
