import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
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
