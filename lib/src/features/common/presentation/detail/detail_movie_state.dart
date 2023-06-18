import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/domain.dart';

class DetailMovieState {
  final AsyncValue<Movie?> movieValue;
  final AsyncValue<List<Movie>> movieListValue;
  final Movie? movie;
  final List<Movie> movieList;
  final bool isMovieFavorite;
  const DetailMovieState({
    this.movieValue = const AsyncLoading(),
    this.movieListValue = const AsyncData([]),
    this.movie,
    this.movieList = const [],
    this.isMovieFavorite = false,
  });

  bool get isLoading => movieValue.isLoading;
  bool get isMovieListLoading => movieListValue.isLoading;

  DetailMovieState copyWith({
    AsyncValue<Movie?>? movieValue,
    AsyncValue<List<Movie>>? movieListValue,
    Movie? movie,
    List<Movie>? movieList,
    bool? isMovieFavorite,
  }) {
    return DetailMovieState(
      movieValue: movieValue ?? this.movieValue,
      movieListValue: movieListValue ?? this.movieListValue,
      movie: movie ?? this.movie,
      movieList: movieList ?? this.movieList,
      isMovieFavorite: isMovieFavorite ?? this.isMovieFavorite,
    );
  }
}
