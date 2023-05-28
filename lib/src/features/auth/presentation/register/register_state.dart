// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final AsyncValue<String?> registerValue;
  final bool isObscure;
  final DateTime? birthDate;
  final int? gender;
  const RegisterState({
    this.registerValue = const AsyncData(null),
    this.isObscure = true,
    this.birthDate,
    this.gender,
  });

  bool get isLoading => registerValue.isLoading;

  RegisterState copyWith({
    AsyncValue<String?>? registerValue,
    bool? isObscure,
    DateTime? birthDate,
    int? gender,
  }) {
    return RegisterState(
      registerValue: registerValue ?? this.registerValue,
      isObscure: isObscure ?? this.isObscure,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
    );
  }
}
