import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/presentation.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(const LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    super.dispose();
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  return LoginController();
});
