import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/services/services.dart';

class FavoriteMovieController extends StateNotifier<FavoriteMovieState> {
  final HiveService _hiveService;
  FavoriteMovieController(
    this._hiveService,
  ) : super(const FavoriteMovieState());

  void getFavoriteMovies() async {
    state = state.copyWith(
      favoriteMovieListValue: const AsyncLoading(),
    );

    final result = _hiveService.getAllFavoriteMovies();
    result.when(
      success: (data) {
        state = state.copyWith(
          favoriteMovieList: data,
          favoriteMovieListValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          favoriteMovieListValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final favoriteMovieControllerProvider =
    StateNotifierProvider<FavoriteMovieController, FavoriteMovieState>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  return FavoriteMovieController(hiveService);
});
