import 'package:bmi_calculator/constants/app_styles.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const IconContent({super.key, required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
          size: 88,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}