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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> lang = ['vi', 'VN'];
    
    void updateLanguage(List<String> newLang) {
    setState(() {
      lang = newLang;
    });
  }

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
      locale: Locale(lang[0], lang[1]),
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

