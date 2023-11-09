import 'package:flutter/material.dart';
import 'package:flutter_weather_api/models/weather_model.dart';

class StateWeather extends StatelessWidget {
  const StateWeather(
      {super.key, required this.weather, required this.textColor});

  final Weather weather;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      weather.current!.condition!.text!,
      style: TextStyle(color: textColor, fontSize: 15),
    );
  }
}
