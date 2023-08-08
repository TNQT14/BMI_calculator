import 'package:bmi_calculator/screens/history_screen.dart';
import 'package:bmi_calculator/screens/input_screen.dart';
import 'package:flutter/material.dart';

import '../model/result.dart';
import '../screens/result_screen.dart';
import '../screens/splash_screen.dart';

class RouteGenerator{
  const RouteGenerator._();

  static Route<dynamic> generatorRouter(RouteSettings setting){
    final args = setting.arguments;

    switch (setting.name)
    {
      case home:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const InputScreen()
        );
        case splash:
        return MaterialPageRoute<SplashScreen>(
          builder: (_) => const SplashScreen(),
        );
      case resultPage:
          BMIResult result = args as BMIResult;
        return MaterialPageRoute<ResultScreen>(
          builder: (_) => ResultScreen(bmiResult: result,),
        );
      case inputPage:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const InputScreen(),
        );
      case historyPage:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const HistoryScreen(),
        );
      default: 
        throw const RouteException('Route not found');
    }
  } 

  static const home = '/';
  static const splash = 'splash';
  static const inputPage = 'input';
  static const resultPage = 'result';
  static const historyPage = 'history';
}

//Exception
class RouteException implements Exception{
  final String message;

  const RouteException(this.message);
}