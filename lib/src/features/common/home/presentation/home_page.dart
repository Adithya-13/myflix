import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World!',
          style: TypographyApp.headline1.white,
        ),
      ),
    );
  }
}
