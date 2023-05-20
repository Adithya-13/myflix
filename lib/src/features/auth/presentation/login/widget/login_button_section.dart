import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class LoginButtonSection extends StatelessWidget {
  const LoginButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.outlined(
          text: 'Login',
          onTap: () {
            context.goNamed(Routes.home.name);
          },
        ),
        Gap.h32,
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.register.name);
          },
          child: Text(
            'Not a Member yet? Register here',
            style: TypographyApp.headline3,
          ),
        ),
        Gap.h16,
        Text(
          'Forgot your password?',
          style: TypographyApp.text1.grey,
        ),
      ],
    );
  }
}
