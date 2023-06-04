// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/services/local/local.dart';

class HomeController extends StateNotifier<HomeState> {
  final CommonService _commonService;
  final HiveService _hiveService;
  HomeController(
    this._commonService,
    this._hiveService,
  ) : super(const HomeState()) {
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

  void logout() {
    _hiveService.logout();
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  final hiveService = ref.read(hiveServiceProvider);
  return HomeController(commonService, hiveService);
});
