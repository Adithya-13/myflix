import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/data.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/services.dart';

import '../../../services/local/hive_service_mock.dart';
import '../../data_mocks.dart';

void main() {
  late AuthResponse authResponse;
  late UserResponse userResponse;
  late RequestLogin requestLogin;

  late MockAuthRepository mockAuthRepository;
  late MockHiveService mockHiveService;

  late AuthService authService;

  setUp(() {
    userResponse = UserResponse(
      id: 1,
      username: 'adithya',
      email: 'adithya@gmail.com',
      gender: 1,
      birthdate: '13-06-2004',
    );
    authResponse = AuthResponse(user: userResponse);
    requestLogin = RequestLogin(
      email: 'adithya@gmail.com',
      password: '12345678',
    );

    mockAuthRepository = MockAuthRepository();
    mockHiveService = MockHiveService();

    authService = AuthService(mockAuthRepository, mockHiveService);
  });

  group('login()', () {
    test('returns String when success', () async {
      const expectedResult = Result.success('Login Success!');
      when(
        () async {
          final result = await mockAuthRepository.login(requestLogin);
          return result.when(
            success: (data) {
              return const Result.success('Login Success!');
            },
            failure: (error, stackTrace) {
              return Result.failure(error, stackTrace);
            },
          );
        },
      ).thenAnswer(
        (invocation) => Future.value(
          const Result.success('Login Success!'),
        ),
      );

      final actualResult = await authService.login(requestLogin);

      expect(actualResult, expectedResult);
    });
  });
}
