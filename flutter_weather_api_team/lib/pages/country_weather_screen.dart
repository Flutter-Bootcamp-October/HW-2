import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';
import 'package:flutter_weather_api/models/astronomy.dart';
import 'package:flutter_weather_api/models/weather_model.dart';
import 'package:flutter_weather_api/widgets/all_weather_info.dart';

class CountryWeatherScreen extends StatefulWidget {
  const CountryWeatherScreen(
      {super.key, required this.weather, required this.weatherAstronomy});
  final Weather weather;
  final WeatherAstronomy weatherAstronomy;

  @override
  State<CountryWeatherScreen> createState() => _CountryWeatherScreenState();
}

class _CountryWeatherScreenState extends State<CountryWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: widget.weather.current!.isDay! == 1
            ? AllWeatherInfo(
                firstGradient: Color.fromARGB(255, 163, 187, 217),
                secondGradient: Color.fromARGB(255, 230, 250, 255),
                themeColor: blue,
                weather: widget.weather,
                weatherAstronomy: widget.weatherAstronomy,
              )
            : AllWeatherInfo(
                firstGradient: Color.fromARGB(255, 23, 19, 59),
                secondGradient: Color.fromARGB(255, 110, 107, 151),
                themeColor: white,
                weather: widget.weather,
                weatherAstronomy: widget.weatherAstronomy,
              ),
      ),
    );
  }
}
