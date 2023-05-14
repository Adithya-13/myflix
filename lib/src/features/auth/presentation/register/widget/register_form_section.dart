import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';

class RegisterFormSection extends ConsumerWidget {
  const RegisterFormSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputFormWidget(
          controller: controller.emailController,
          onChanged: (value) {},
          hintText: 'Email',
        ),
        Gap.h16,
        InputFormWidget.password(
          controller: controller.passwordController,
          onChanged: (value) {},
          hintText: 'Password',
          onObscureTap: controller.onObscureTap,
          isObscure: state.isObscure,
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.usernameController,
          onChanged: (value) {},
          hintText: 'Username',
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.birthdateController,
          onChanged: (value) {},
          hintText: 'Birthdate',
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.genderController,
          onChanged: (value) {},
          hintText: 'Gender',
        ),
      ],
    );
  }
}
