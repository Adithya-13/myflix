import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';

class LoginFormSection extends ConsumerWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

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
          isObscure: state.isObscure,
          onObscureTap: controller.onObscureTap,
        ),
      ],
    );
  }
}
