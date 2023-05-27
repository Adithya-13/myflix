class RegisterState {
  final bool isObscure;
  const RegisterState({
    this.isObscure = true,
  });

  RegisterState copyWith({
    bool? isObscure,
  }) {
    return RegisterState(
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
