import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class DetailMoviePage extends ConsumerStatefulWidget {
  final int id;
  const DetailMoviePage({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends ConsumerState<DetailMoviePage> {
  DetailMovieController get controller =>
      ref.read(detailMovieControllerProvider.notifier);
  DetailMovieState get state => ref.watch(detailMovieControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getMovieById(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AsyncValueWidget(
            value: state.movieValue,
            data: (data) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const TopBarDetailSection(),
                  Gap.h16,
                  const VideoPlayerSection(),
                  Gap.h16,
                  const DetailMovieInfoSection(),
                  Gap.h16,
                  const RelatedMoviesSection(),
                ],
              );
            }),
      ),
    );
  }
}

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

class VideoPlayerSection extends StatelessWidget {
  const VideoPlayerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: CachedNetworkImage(
        imageUrl: dummyImageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TopBarDetailSection extends StatelessWidget {
  const TopBarDetailSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Icon(
            Icons.favorite_border_rounded,
            color: ColorApp.white,
            size: SizeApp.h28,
          ),
        ],
      ),
    );
  }
}
