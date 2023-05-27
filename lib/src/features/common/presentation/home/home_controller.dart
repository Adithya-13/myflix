import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/presentation.dart';

class HomeController extends StateNotifier<HomeState> {
  final CommonService _commonService;
  HomeController(this._commonService) : super(const HomeState()) {
    fetchHome();
  }

  void fetchHome() async {
    state = state.copyWith(
      homeValue: const AsyncLoading(),
    );

    print(state.homeValue);

    final result = await _commonService.fetchHome();

    result.when(
      success: (data) {
        state = state.copyWith(
          home: data,
          homeValue: AsyncData(data),
        );
        print(state.homeValue);
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          homeValue: AsyncError(error, stackTrace),
        );
        print(state.homeValue);
      },
    );
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return HomeController(commonService);
});
