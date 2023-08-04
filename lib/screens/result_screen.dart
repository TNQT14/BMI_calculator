import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/model/result.dart';
import 'package:flutter/material.dart';

import '../component/bottom_button.dart';
import '../constants/app_styles.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: const Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(bmiResult.resultText.toUpperCase(),
                  style: kResultTextStyle,
                  ),
                  Text(bmiResult.resultBMIScore.toUpperCase(),
                  style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bmiResult.resultInterpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATOR",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}