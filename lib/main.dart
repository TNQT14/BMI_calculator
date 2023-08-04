import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.appPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appPrimaryColor,
        ),
        scaffoldBackgroundColor: AppColors.appPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}

