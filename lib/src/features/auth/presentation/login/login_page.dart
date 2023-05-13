import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/gen/assets.gen.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w32,
          ),
          child: Column(
            children: [
              Center(
                child: Assets.icons.myflixLogo.svg(
                  width: context.screenWidthPercentage(0.32),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              const InputFormWidget(
                hintText: 'Email',
              ),
              Gap.h16,
              const InputFormWidget(
                hintText: 'Password',
              ),
              Gap.h32,
              ButtonWidget(
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
