import 'package:flutter/material.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({super.key, required this.iconColor});
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Image.asset(
          "assets/thermometer.png",
          color: iconColor,
          height: 30,
          width: 50,
        ),
        Image.asset(
          "assets/wind.png",
          color: iconColor,
          height: 30,
          width: 50,
        ),
      ],
    );
  }
}
