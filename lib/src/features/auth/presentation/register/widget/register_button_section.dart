import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/routes/routes.dart';

class RegisterButtonSection extends StatelessWidget {
  const RegisterButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget(
          text: 'Register',
          onTap: () {},
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
