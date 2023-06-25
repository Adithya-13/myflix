import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/services/local/local.dart';

class HomeController extends StateNotifier<HomeState> {
  final CommonService _commonService;
  final HiveService _hiveService;

  final scrollController = ScrollController();

  HomeController(
    this._commonService,
    this._hiveService,
  ) : super(const HomeState()) {
    fetchHome();
    fetchPopular();
    scrollController.addListener(popularPagination);
  }

  void popularPagination() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!state.isPopularLoading) {
        state = state.copyWith(
          page: state.page + 1,
        );

        if (state.hasMore) {
          fetchPopular();
        }
      }
    }
  }

  void fetchHome() async {
    state = state.copyWith(
      homeValue: const AsyncLoading(),
    );

    debugPrint(state.homeValue.toString());

    final result = await _commonService.fetchHome();

    result.when(
      success: (data) {
        state = state.copyWith(
          home: data,
          homeValue: AsyncData(data),
        );
        debugPrint(state.homeValue.toString());
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          homeValue: AsyncError(error, stackTrace),
        );
        debugPrint(state.homeValue.toString());
      },
    );
  }

  void fetchPopular() async {
    state = state.copyWith(
      popularValue: const AsyncLoading(),
    );

    final result = await _commonService.getPopular(state.page);

    result.when(
      success: (data) {
        state = state.copyWith(
          popularValue: AsyncData(data.popularList),
          popular: [...state.popular, ...data.popularList],
          hasMore: state.page < data.totalPages,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          popularValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void logout() {
    _hiveService.logout();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  final hiveService = ref.read(hiveServiceProvider);
  return HomeController(commonService, hiveService);
});
