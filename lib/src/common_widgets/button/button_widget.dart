// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';

enum ButtonType {
  primary,
  outlined,
}

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final Function()? onTap;
  final bool isLoading;
  final Widget? prefix;

  const ButtonWidget({
    Key? key,
    required this.buttonType,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.prefix,
  }) : super(key: key);

  const ButtonWidget.primary({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.prefix,
  }) : buttonType = ButtonType.primary;

  const ButtonWidget.outlined({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.prefix,
  }) : buttonType = ButtonType.outlined;

  Color getColor() =>
      buttonType == ButtonType.primary ? ColorApp.red : ColorApp.black;

  Color getFocusColor() =>
      buttonType == ButtonType.primary ? ColorApp.darkRed : ColorApp.darkGrey;

  bool get isPrimary => buttonType == ButtonType.primary;
  bool get isOutlined => buttonType == ButtonType.outlined;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: isOutlined
            ? const BorderSide(
                color: ColorApp.white,
                width: 0.4,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: isOutlined
              ? const BorderSide(
                  color: ColorApp.white,
                  width: 0.4,
                )
              : BorderSide.none,
        ),
        overlayColor: MaterialStateProperty.all(getFocusColor()),
        focusColor: getFocusColor(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w28,
            vertical: SizeApp.h16,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: SizeApp.customHeight(22),
                    width: SizeApp.customHeight(22),
                    child: const LoadingWidget(),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (prefix != null) ...[
                        prefix!,
                        Gap.w8,
                      ],
                      Text(
                        text,
                        style: TypographyApp.headline3,
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
