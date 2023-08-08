import 'package:bmi_calculator/component/bottom_button.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/component/round_icon_button.dart';
import 'package:bmi_calculator/constants/app_styles.dart';
import 'package:bmi_calculator/localization/app_localization.dart';
import 'package:bmi_calculator/services/calculator.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../model/gender.dart';
import '../model/result.dart';
import '../routes/routes.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> with SingleTickerProviderStateMixin {

  Gender selectedGender = Gender.other;
  int height = 180;
  int weight = 60;
  int age = 20;
  bool isSwitched = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: -1,
      upperBound: 0,
    );
    controller.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: AppColors.appPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        title: Center(child: Text(
          context.localize('title'),
          style: kLargeButtonTextStyle,)
          ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            Navigator.pushNamed(context, RouteGenerator.historyScreen);
          },
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              selectedGender = Gender.other;
              height = 180;
              weight = 60;
              age = 20;
            });
          },
           icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child){
                      return Transform.translate(
                        offset: Offset(controller.value *200, 0),
                        child: child,
                        );
                    },
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          color: selectedGender == Gender.male
                            ? Colors.blueAccent
                            : Colors.white,
                          icon: Icons.male,
                          label: context.localize('label_male'),
                        ),         
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(controller.value*-200, 0),
                        child: child,
                        );
                    },
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                        color: selectedGender == Gender.female
                            ? Colors.orange
                            : Colors.white,
                        icon: Icons.female,
                        label: context.localize('label_female'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(controller.value * -400, 0),
                  child: child,
                );
              },
              child: ReusableCard(
                color: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      context.localize('label_height'),
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),
                            style: kNumberTextStyle,),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                    ),
                     SliderTheme(data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                           child:  Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),),
                  ],
                ),),
            )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, Widget? child){
                      return Transform.translate(
                        offset: Offset(controller.value*200, 0),
                        child: child,
                      );
                    },
                    child: ReusableCard(
                      color: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              context.localize('label_weight'),
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(icon: Icons.remove,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                const SizedBox(width: 10),
                                RoundIconButton(icon: Icons.add,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                })
                              ],
                            ),
                        ],
                      ),),
                  ),
                ),
              Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, Widget? child){
                      return Transform.translate(
                        offset: Offset(controller.value*-200, 0),
                        child: child,
                      );
                    },
                    child: ReusableCard(
                      color: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              context.localize('label_age'),
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(icon: Icons.remove,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }),
                                const SizedBox(width: 10),
                                RoundIconButton(icon: Icons.add,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                })
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SwitchListTile(
              title: Text(context.localize('label_languages')),
              value: isSwitched,
              onChanged: (value){
                setState(() {
                  isSwitched = value;
                  if(value == false) {
                    
                  }
                });
              },
            )
            ),
          BottomButton(
                onTap: () async {
                  if(selectedGender == Gender.other) {
                    showSnackBar(context, "Please choose your Gender");
                  } else {
                    Calculator calc = Calculator(
                  height: height,
                  weight: weight,
                  );

                  Navigator.pushNamed(
                  context,
                  RouteGenerator.resultScreen,
                  arguments: BMIResult(
                    resultBMIScore: await calc.calculateBMI(),
                    resultText: await calc.getResult(),
                    resultInterpretation: await calc.getInterpretation(),
                    resultColor: await calc.getStatusColor(),
                  ),
                  );
                    
                  }
                  },
                buttonTitle: context.localize('label_calculate')),
        ],
      ),
    );
  }
}