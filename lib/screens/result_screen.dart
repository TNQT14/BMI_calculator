
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/localization/app_localization.dart';
import 'package:bmi_calculator/model/result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component/bottom_button.dart';
import '../constants/app_styles.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.bmiResult}): super(key: key);
  final BMIResult bmiResult;

  void onSavedPressed(String bmi, String status, int colorStatus) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      //List String
      List<String> saveList = prefs.getStringList('saveList')??[]; 
      DateTime now  = DateTime.now();
      String formatDate = DateFormat('yyyy-MM-dd -kk:mm').format(now);
      saveList.add('{"bmi":"$bmi","status": "$status","statusColor":"$colorStatus","formatDate":"$formatDate"}');

      await prefs.setStringList('saveList', saveList);
    } catch(e){
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(context.localize('title'))),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            if(bmiResult != null){
              onSavedPressed(
                bmiResult.resultBMIScore,
                bmiResult.resultText, 
                bmiResult.resultColor.value);
            }
          }, 
          icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                context.localize('label_result'),
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
            buttonTitle: context.localize('label_recalculate'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}