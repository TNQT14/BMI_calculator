import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimaryColor,
      appBar: AppBar(
        // backgroundColor: AppColors.cetaceanBlue,
        title: const Center(child: Text("Title")),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
          },
        ),
        actions: [
          IconButton(onPressed: (){},
           icon: const Icon(Icons.refresh))
        ],
      ),
      body: const Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColour,
              cardChild: IconContent(
                color: Colors.white,
                icon: Icons.male,
                label: 'MALE',
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColour,
              cardChild: IconContent(
                color: Colors.white,
                icon: Icons.female,
                label: 'FEMALE',
              ),
            ),
          ),
        ],
      ),
    );
  }
}