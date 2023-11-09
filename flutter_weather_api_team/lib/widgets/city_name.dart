import 'package:flutter/material.dart';
import 'package:flutter_weather_api/models/weather_model.dart';

class CityName extends StatelessWidget {
  const CityName({super.key, required this.weather, required this.textColor});
  final Weather weather;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      weather.location!.name!,
      style: TextStyle(color: textColor, fontSize: 30),
    );
  }
}
