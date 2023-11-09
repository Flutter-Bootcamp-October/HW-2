import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';
import 'package:flutter_weather_api/models/weather_model.dart';

class AddButtom extends StatelessWidget {
  const AddButtom({super.key, required this.weather, required this.themeColor});
  final Weather weather;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          favoritCity.add(weather);
          print(weather.location!.name);
        },
        child:  Text(
          "Add",
          style: TextStyle(color: themeColor, fontSize: 18),
        ));
  }
}
