import 'package:bmi_calculator/component/bottom_button.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/component/round_icon_button.dart';
import 'package:bmi_calculator/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../model/gender.dart';

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
        title: const Center(child: Text("BMI CALCULATOR",
        style: kLargeButtonTextStyle,)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            setState(() {
              selectedGender = Gender.other;
              height = 180;
              weight = 60;
              age = 20;
            });
          },
        ),
        actions: [
          IconButton(onPressed: (){},
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
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: Center(
                      child: IconContent(
                        color: selectedGender == Gender.male
                          ? Colors.blueAccent
                          : Colors.white,
                        icon: Icons.male,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Height",
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
              ),)
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          const Text(
                            '60',
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: Icons.add,
                              onPressed: (){}),
                              const SizedBox(width: 10),
                              RoundIconButton(icon: Icons.remove,
                              onPressed: (){})
                            ],
                          ),
                      ],
                    ),),
                ),
              Expanded(
                  child: ReusableCard(
                    color: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          const Text(
                            '30',
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: Icons.add,
                              onPressed: (){}),
                              const SizedBox(width: 10),
                              RoundIconButton(icon: Icons.remove,
                              onPressed: (){})
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
                onTap: (){},
                buttonTitle: 'CALCULATE'),
        ],
      ),
    );
  }
}