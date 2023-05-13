import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/gen/assets.gen.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              Gap.h16,
              const InputFormWidget(
                hintText: 'Username',
              ),
              Gap.h16,
              const InputFormWidget(
                hintText: 'Birthdate',
              ),
              Gap.h16,
              const InputFormWidget(
                hintText: 'Gender',
              ),
              Gap.h32,
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
