import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/presentation.dart';

class DetailMovieController extends StateNotifier<DetailMovieState> {
  final CommonService _commonService;
  DetailMovieController(this._commonService) : super(const DetailMovieState());

  void getMovieById(int id) async {
    state = state.copyWith(
      movieValue: const AsyncLoading(),
    );

    print(state.movieValue);

    final result = await _commonService.getMovieById(id);

    result.when(
      success: (data) {
        state = state.copyWith(
          movie: data,
          movieValue: AsyncData(data),
        );
        print(state.movieValue);
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          movieValue: AsyncError(error, stackTrace),
        );
        print(state.movieValue);
      },
    );
  }
}

final detailMovieControllerProvider =
    StateNotifierProvider.autoDispose<DetailMovieController, DetailMovieState>(
        (ref) {
  final commonService = ref.read(commonServiceProvider);
  return DetailMovieController(commonService);
});
