import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/domain.dart';

class HomeState {
  final AsyncValue<Home?> homeValue;
  final Home? home;
  const HomeState({
    this.homeValue = const AsyncLoading(),
    this.home,
  });

  HomeState copyWith({
    AsyncValue<Home?>? homeValue,
    Home? home,
  }) {
    return HomeState(
      homeValue: homeValue ?? this.homeValue,
      home: home ?? this.home,
    );
  }
}
