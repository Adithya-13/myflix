import 'package:flutter/material.dart';
import 'package:myflix/gen/assets.gen.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentation.dart';
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
              const LoginFormSection(),
              Gap.h32,
              const LoginButtonSection(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
