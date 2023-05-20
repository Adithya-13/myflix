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
}

final commonServiceProvider = Provider<CommonService>((ref) {
  return CommonService();
});
