import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflix/src/constants/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const ButtonWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorApp.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(
          color: ColorApp.white,
          width: 0.4,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(
            color: ColorApp.white,
            width: 0.4,
          ),
        ),
        overlayColor: MaterialStateProperty.all(ColorApp.darkGrey),
        focusColor: ColorApp.darkGrey,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w28,
            vertical: SizeApp.h16,
          ),
          child: Center(
            child: Text(
              text,
              style: TypographyApp.headline3,
            ),
          ),
        ),
      ),
    );
  }
}
