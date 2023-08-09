import 'package:bmi_calculator/screens/history_screen.dart';
import 'package:bmi_calculator/screens/input_screen.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:bmi_calculator/utils/widget_language_picker.dart';
import 'package:flutter/material.dart';

import '../model/result.dart';


class RouteGenerator{
  const RouteGenerator._();

  static Route<dynamic> generatorRouter(RouteSettings setting){
    final args = setting.arguments;
    switch (setting.name)
    {
      case home:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const InputScreen(),
        );
        case splashScreen:
        return MaterialPageRoute<SplashScreen>(
          builder: (_) => const SplashScreen(),
        );
      case resultScreen:
          BMIResult result = args as BMIResult;
        return MaterialPageRoute<ResultScreen>(
          builder: (_) => ResultScreen(bmiResult: result,),
        );
      case inputScreen:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const InputScreen(),
        );
      case historyScreen:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const HistoryScreen(),
        );
      case languageScreen:
        return MaterialPageRoute<LanguageWidget>(
          builder: (_) =>  LanguageWidget(),
        );
      default: 
        throw const RouteException('Route not found');
    }
  } 

  static const home = '/';
  static const splashScreen = 'splash';
  static const inputScreen = 'input';
  static const resultScreen = 'result';
  static const historyScreen = 'history';
  static const languageScreen = 'language';
}

//Exception
class RouteException implements Exception{
  final String message;
  const RouteException(this.message);
}