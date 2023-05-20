import 'package:flutter/material.dart';
import 'package:myflix/src/features/presentation.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class HeaderMovieSection extends StatelessWidget {
  const HeaderMovieSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeightPercentage(0.72),
      child: Stack(
        children: const [
          Positioned.fill(
            child: HeaderMovieImageSection(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: HeaderMovieInfoSection(),
          ),
        ],
      ),
    );
  }
}
