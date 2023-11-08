import 'package:flutter/material.dart';
import 'package:flutter_weather_api/models/weather_model.dart';

class CountryNameAndDate extends StatelessWidget {
  const CountryNameAndDate(
      {super.key, required this.weather, required this.textColor});

  final Weather weather;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      weather.location!.country!,
      style: TextStyle(color: textColor),
    );
  }
}
