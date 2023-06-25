// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myflix/src/features/domain.dart';

class HomeState {
  final AsyncValue<Home?> homeValue;
  final Home? home;
  final AsyncValue<List<Movie>> popularValue;
  final List<Movie> popular;
  final bool hasMore;
  final int page;

  const HomeState({
    this.homeValue = const AsyncLoading(),
    this.home,
    this.popularValue = const AsyncData([]),
    this.popular = const [],
    this.hasMore = true,
    this.page = 1,
  });

  bool get isPopularLoading => popularValue.isLoading;

  HomeState copyWith({
    AsyncValue<Home?>? homeValue,
    Home? home,
    AsyncValue<List<Movie>>? popularValue,
    List<Movie>? popular,
    bool? hasMore,
    int? page,
  }) {
    return HomeState(
      homeValue: homeValue ?? this.homeValue,
      home: home ?? this.home,
      popularValue: popularValue ?? this.popularValue,
      popular: popular ?? this.popular,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }
}
