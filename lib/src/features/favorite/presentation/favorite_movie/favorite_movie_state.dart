import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/domain.dart';

class FavoriteMovieState {
  final List<Movie> favoriteMovieList;
  final AsyncValue<List<Movie>> favoriteMovieListValue;

  const FavoriteMovieState({
    this.favoriteMovieList = const [],
    this.favoriteMovieListValue = const AsyncLoading(),
  });

  bool get isLoading => favoriteMovieListValue.isLoading;

  FavoriteMovieState copyWith({
    List<Movie>? favoriteMovieList,
    AsyncValue<List<Movie>>? favoriteMovieListValue,
  }) {
    return FavoriteMovieState(
      favoriteMovieList: favoriteMovieList ?? this.favoriteMovieList,
      favoriteMovieListValue:
          favoriteMovieListValue ?? this.favoriteMovieListValue,
    );
  }
}
