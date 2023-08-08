// import 'package:bmi_calculator/screens/input_screen.dart';
import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../constants/app_image_app.dart';
import '../routes/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const int duration = 1;

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: duration),
    (){
      Navigator.pushReplacementNamed(context, RouteGenerator.inputScreen);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.cetaceanBlue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImagePaths.appSplashLogo,
                width: 125,
              ),
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              const Text(
                "BMI CALCULATOR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              const CircularProgressIndicator(
                color: Color(0xffFF0C63),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Check Your BMI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
