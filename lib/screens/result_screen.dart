import 'package:bmi_calculator/model/result.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.bmiResult}): super(key: key);
  final BMIResult bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        elevation: 0,
      ),
      body: Container(),
    );
  }
}