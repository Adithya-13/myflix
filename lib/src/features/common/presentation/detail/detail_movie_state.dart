import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/domain.dart';

class DetailMovieState {
  final AsyncValue<Movie?> movieValue;
  final Movie? movie;
  const DetailMovieState({
    this.movieValue = const AsyncLoading(),
    this.movie,
  });

  bool get isLoading => movieValue.isLoading;

  DetailMovieState copyWith({
    AsyncValue<Movie?>? movieValue,
    Movie? movie,
  }) {
    return DetailMovieState(
      movieValue: movieValue ?? this.movieValue,
      movie: movie ?? this.movie,
    );
  }
}
