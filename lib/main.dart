import 'package:bmi_calculator/localization/app_localization.dart';
import 'package:bmi_calculator/localization/localization_delegate.dart';
import 'package:bmi_calculator/routes/routes.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.appPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appPrimaryColor,
        ),
        scaffoldBackgroundColor: AppColors.appPrimaryColor,
      ),
      initialRoute: RouteGenerator.splashScreen,
      onGenerateRoute: RouteGenerator.generatorRouter,
      home: const SplashScreen(),
      // locale: const Locale("vi", "VN"),
      locale: const Locale("en", "EN"),
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale.fromSubtags(languageCode: "en"),
        Locale.fromSubtags(languageCode: "vi"),
      ],
      onGenerateTitle: (context) => context.localize("title"),
    );
  }
}

