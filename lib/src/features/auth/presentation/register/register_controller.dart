import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final AuthService _authService;
  RegisterController(
    this._authService,
  ) : super(const RegisterState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final birthdateController = TextEditingController();

  Future<void> register() async {
    // loading
    state = state.copyWith(
      registerValue: const AsyncLoading(),
    );

    final requestRegister = RequestRegister(
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
      birthdate: birthdateController.text,
      gender: state.gender ?? -1,
    );

    final result = await _authService.register(requestRegister);

    result.when(
      success: (data) {
        // success
        state = state.copyWith(
          registerValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        // failure
        state = state.copyWith(
          registerValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void onObscureTap() {
    // with setState in StatefulWidget
    //setState(() {
    //   isObscure = !isObscure;
    // });

    // with state.copyWith in Riverpod
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  void onBirthDatePicked(DateTime? pickedDate) {
    if (pickedDate != null) {
      birthdateController.text = pickedDate.toYyyyMMDd;
      state = state.copyWith(
        birthDate: pickedDate,
      );
    }
  }

  void onGenderChanged(int? gender) {
    state = state.copyWith(
      gender: gender,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    birthdateController.dispose();
    super.dispose();
  }
}

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>((ref) {
  final authService = ref.read(authServiceProvider);
  return RegisterController(authService);
});
