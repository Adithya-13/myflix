import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/services/services.dart';

class DetailMovieController extends StateNotifier<DetailMovieState> {
  final CommonService _commonService;
  final HiveService _hiveService;
  DetailMovieController(this._commonService, this._hiveService)
      : super(const DetailMovieState());

  void getMovieById(int id) async {
    state = state.copyWith(
      movieValue: const AsyncLoading(),
    );

    final result = await _commonService.getMovieById(id);

    result.when(
      success: (data) {
        state = state.copyWith(
          movie: data,
          movieValue: AsyncData(data),
          isMovieFavorite: _hiveService.isMovieFavorite(data.id),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          movieValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void toggleFavoriteMovie() {
    if (state.isMovieFavorite) {
      _hiveService.deleteFavoriteMovie(state.movie!.id);
    } else {
      _hiveService.saveFavoriteMovie(state.movie!);
    }

    state = state.copyWith(
      isMovieFavorite: _hiveService.isMovieFavorite(state.movie!.id),
    );
  }
}

final detailMovieControllerProvider =
    StateNotifierProvider.autoDispose<DetailMovieController, DetailMovieState>(
        (ref) {
  final commonService = ref.read(commonServiceProvider);
  final hiveService = ref.read(hiveServiceProvider);
  return DetailMovieController(commonService, hiveService);
});
