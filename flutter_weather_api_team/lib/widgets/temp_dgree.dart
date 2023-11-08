import 'package:flutter/material.dart';
import 'package:flutter_weather_api/models/weather_model.dart';

class TempDegree extends StatelessWidget {
  const TempDegree(
      {super.key,
      required this.weather,
      required this.textColor,
      required this.fonttempSize,
      required this.fontOSize,
      required this.fontCSize});

  final Weather weather;
  final Color textColor;
  final double fonttempSize;
  final double fontOSize;
  final double fontCSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${weather.current!.tempC?.toInt()} ',
          style: TextStyle(color: textColor, fontSize: fonttempSize),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Text(
            'o',
            style: TextStyle(color: textColor, fontSize: fontOSize),
          ),
        ),
        Text(
          'C',
          style: TextStyle(color: textColor, fontSize: fontCSize),
        ),
      ],
    );
  }
}
