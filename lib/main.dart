

import 'package:fastrash/onboarding/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FastTrash Mobile',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'DMSans',
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.0.sp, displayColor: Colors.black),
          ),
          home: const SplashScreen(),
        );
      },
      ///child: const DashBoardScreen(),
    );

  }
}
