import 'package:flutter/material.dart';
import 'package:myflix/gen/assets.gen.dart';
import 'package:myflix/src/constants/constants.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Gap.w8,
          Assets.icons.icMyflixM.svg(
            height: SizeApp.h32,
            fit: BoxFit.fitHeight,
          ),
          Gap.w8,
          Text(
            'Series',
            style: TypographyApp.headline3,
          ),
          Gap.w8,
          Text(
            'Movies',
            style: TypographyApp.headline3,
          ),
          Gap.w8,
          Text(
            'My List',
            style: TypographyApp.headline3,
          ),
          Gap.w8,
          Icon(
            Icons.search_rounded,
            color: ColorApp.white,
            size: SizeApp.h24,
          ),
          Gap.w8,
        ],
      ),
    );
  }
}
