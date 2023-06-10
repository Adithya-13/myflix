import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/services.dart';

final dummyDetailMovie = [
  dummyMovie.copyWith(id: 1),
  dummyMovie.copyWith(id: 2),
  dummyMovie.copyWith(id: 3),
  dummyMovie.copyWith(id: 4),
  dummyMovie.copyWith(id: 5),
  dummyMovie.copyWith(id: 6),
  dummyMovie.copyWith(id: 7),
  dummyMovie.copyWith(id: 8),
  dummyMovie.copyWith(id: 9),
  dummyMovie.copyWith(id: 10),
  dummyMovie.copyWith(id: 11),
  dummyMovie.copyWith(id: 12),
  dummyMovie.copyWith(id: 13),
  dummyMovie.copyWith(id: 14),
  dummyMovie.copyWith(id: 15),
  dummyMovie.copyWith(id: 16),
  dummyMovie.copyWith(id: 17),
];

class CommonService {
  Future<Result<Home>> fetchHome() async {
    // DUMMY

    // proses loading (rekayasa jika loading lewat API)
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(dummyHome);

    // from API
    // commonRepository.fetchHome();
  }

  Future<Result<Movie>> getMovieById(int id) async {
    // DUMMY

    // proses loading (rekayasa jika loading lewat API)
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(
      dummyDetailMovie.firstWhere((element) => element.id == id),
    );
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  return CommonService();
});
