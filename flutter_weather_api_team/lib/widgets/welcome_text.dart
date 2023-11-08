import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText(
      {super.key, required this.welcomeText, required this.textColor});

  final String welcomeText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      welcomeText,
      style: TextStyle(color: textColor),
    );
  }
}
