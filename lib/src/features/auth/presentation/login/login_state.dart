class LoginState {
  final bool isObscure;
  const LoginState({
    this.isObscure = true,
  });

  LoginState copyWith({
    bool? isObscure,
  }) {
    return LoginState(
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
