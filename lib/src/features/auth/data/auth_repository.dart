import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/exceptions/network_exceptions.dart';
import 'package:myflix/src/features/data.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/services.dart';

class AuthRepository {
  final DioClient _dioClient;

  AuthRepository(this._dioClient);

  Future<Result<LoginResponse>> login(RequestLogin requestLogin) async {
    try {
      final response = await _dioClient.post(
        Endpoint.login,
        data: requestLogin.toJson(),
      );

      return Result.success(LoginResponse.fromJson(response['data']));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioClientProvider);
  return AuthRepository(dio);
});