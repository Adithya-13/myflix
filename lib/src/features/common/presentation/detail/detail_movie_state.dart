import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myflix/src/features/domain.dart';

class DetailMovieState {
  final AsyncValue<Movie?> movieValue;
  final Movie? movie;
  final bool isMovieFavorite;
  const DetailMovieState({
    this.movieValue = const AsyncLoading(),
    this.movie,
    this.isMovieFavorite = false,
  });

  bool get isLoading => movieValue.isLoading;

  DetailMovieState copyWith({
    AsyncValue<Movie?>? movieValue,
    Movie? movie,
    bool? isMovieFavorite,
  }) {
    return DetailMovieState(
      movieValue: movieValue ?? this.movieValue,
      movie: movie ?? this.movie,
      isMovieFavorite: isMovieFavorite ?? this.isMovieFavorite,
    );
  }
}
