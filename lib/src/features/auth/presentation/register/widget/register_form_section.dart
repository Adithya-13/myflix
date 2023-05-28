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
          /* 
          errorText: dari API
          validator: (value) {
            if(value == null){
              return "Cannot be null";
            } else if(!value.isEmail){
              return "email not the right email"
            }

            return null;
          }
          */
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
        InputFormWidget.button(
          controller: controller.birthdateController,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: state.birthDate ?? DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime.now(),
            );
            controller.onBirthDatePicked(pickedDate);
          },
          hintText: 'Birthdate',
        ),
        Gap.h16,
        DropdownWidget<int>(
          hintText: 'Gender',
          items: [
            DropdownMenuItem(
              value: 0,
              child: Text(
                'Male',
                style: TypographyApp.text1,
              ),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text(
                'Female',
                style: TypographyApp.text1,
              ),
            ),
          ],
          onChanged: controller.onGenderChanged,
          value: state.gender,
        )
      ],
    );
  }
}
