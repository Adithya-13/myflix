import 'package:flutter/material.dart';
import 'package:myflix/src/common_widgets/common_widgets.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class TitleMoreSection extends StatelessWidget {
  final String title;
  final VoidCallback? onMoreTap;
  const TitleMoreSection({
    Key? key,
    required this.title,
    this.onMoreTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TypographyApp.headline2,
            ),
          ),
          Gap.w8,
          GestureDetector(
            onTap: onMoreTap,
            child: Text(
              'MORE',
              style: TypographyApp.headline2.red,
            ),
          ),
        ],
      ),
    );
  }
}
