import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/presentation.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(const RegisterState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final birthdateController = TextEditingController();
  final genderController = TextEditingController();

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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    birthdateController.dispose();
    genderController.dispose();
    super.dispose();
  }
}

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>((ref) {
  return RegisterController();
});
