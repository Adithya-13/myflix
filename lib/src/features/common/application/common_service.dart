import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/services.dart';

class CommonService {
  Future<Result<Home>> fetchHome() async {
    // DUMMY

    // proses loading (rekayasa jika loading lewat API)
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(dummyHome);
  }

  Future<Result<Movie>> getMovieById(int id) async {
    // DUMMY

    // proses loading (rekayasa jika loading lewat API)
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(dummyMovie);
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  return CommonService();
});
