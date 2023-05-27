import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/services/services.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  /// [INFO] Init hive local db
  await hiveInit();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(goRouterProvider);

    /// [INFO]
    /// As we use flutter_screenutil for responsive pixel
    /// with considering the design system size (390, 844).
    /// then don't forget to use these extension :
    /// 1. .h -> to pixel related with height, ex : 16.h
    /// 2. .w -> to pixel related with width, ex : 24.w
    /// 3. .r -> to pixel related with radius, ex : 8.r
    /// 4. .sp -> to pixel related with font size, ex : 14.sp
    ///
    /// [INFO]
    /// FocusManager is used for unfocus whenever user click outside of the textfield, it will unfocus.
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        builder: (context, child) {
          return OverlaySupport.global(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              title: 'MyFlix',
              theme: _appTheme,
            ),
          );
        },
      ),
    );
  }
}

final _appTheme = ThemeData(
  scaffoldBackgroundColor: ColorApp.black,
  colorScheme: const ColorScheme.dark(
    primary: ColorApp.red,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
