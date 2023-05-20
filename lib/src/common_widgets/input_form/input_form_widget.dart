import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

enum InputFormType {
  normal,
  password,
}

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final bool isObscure;
  final Function()? onObscureTap;
  final InputFormType inputFormType;

  const InputFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  })  : inputFormType = InputFormType.normal,
        isObscure = false,
        onObscureTap = null;

  const InputFormWidget.password({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.isObscure = true,
    this.onObscureTap,
  }) : inputFormType = InputFormType.password;

  bool get isPassword => inputFormType == InputFormType.password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorApp.darkGrey,
        hintText: hintText,
        hintStyle: TypographyApp.text1.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        suffix: isPassword
            ? GestureDetector(
                onTap: onObscureTap,
                child: Text(
                  isObscure ? 'SHOW' : 'HIDE',
                  style: TypographyApp.text1.grey,
                ),
              )
            : const SizedBox.shrink(),
      ),
      style: TypographyApp.text1,
    );
  }
}
