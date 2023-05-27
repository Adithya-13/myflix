// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final movieList = state.home?.movieListItems;
    return Scaffold(
      body: AsyncValueWidget(
          value: state.homeValue,
          data: (context) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: const [
                    HeaderMovieSection(),
                    Positioned(
                      top: 20,
                      right: 0,
                      left: 0,
                      child: TopBarSection(),
                    ),
                  ],
                ),
                Gap.h40,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: movieList!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final moviesItem = movieList[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleMoreSection(
                          title: moviesItem.title,
                          onMoreTap: () {},
                        ),
                        Gap.h20,
                        MovieListSection(
                          movieItems: moviesItem.movieItems,
                        ),
                        Gap.h40,
                      ],
                    );
                  },
                ),
              ],
            );
          }),
    );
  }
}
