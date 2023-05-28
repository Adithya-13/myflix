import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/gen/assets.gen.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/exceptions/network_exceptions.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';
import 'package:overlay_support/overlay_support.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen(registerControllerProvider, (prevState, state) {
      if (prevState?.registerValue != state.registerValue) {
        state.registerValue.whenOrNull(
          data: (data) {
            if (data != null) {
              context.goNamed(Routes.home.name);
            }
          },
          error: (error, stackTrace) {
            final message =
                NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            toast(message);
          },
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: PaddingWidget(
          child: Column(
            children: [
              Center(
                child: Assets.icons.myflixLogo.svg(
                  width: context.screenWidthPercentage(0.32),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              const RegisterFormSection(),
              Gap.h32,
              const RegisterButtonSection(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
