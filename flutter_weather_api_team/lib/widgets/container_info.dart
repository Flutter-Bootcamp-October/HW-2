import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo(
      {super.key,
      required this.textColor,
      required this.iconColor,
      required this.text,
      required this.imageIcon,
      required this.textObj});
  final Color textColor;
  final Color iconColor;
  final String text;
  final String imageIcon;
  final String textObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          Image.asset(
            imageIcon,
            color: iconColor,
            height: 30,
            width: 50,
          ),
          height10,
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          height4,
          Text(
            textObj,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
