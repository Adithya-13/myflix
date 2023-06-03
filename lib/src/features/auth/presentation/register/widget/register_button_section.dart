import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';

class RegisterButtonSection extends ConsumerWidget {
  const RegisterButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.outlined(
          text: 'Register',
          onTap: controller.register,
          isLoading: state.isLoading,
          isEnabled: state.isRegisterValid,
        ),
        Gap.h32,
        GestureDetector(
          onTap: () {
            context.goNamed(Routes.login.name);
          },
          child: Text(
            'Have an Account? Login here',
            style: TypographyApp.headline3,
          ),
        ),
      ],
    );
  }
}
