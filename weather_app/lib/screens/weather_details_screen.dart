import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';

class WeatherDetailsScreen extends StatefulWidget {
  const WeatherDetailsScreen({super.key,});
  // final Weather weather;
  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  bool day = true;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: day
          ? const Color.fromARGB(138, 13, 72, 161)
          : const Color.fromARGB(117, 187, 222, 251),
      appBar: AppBar(
          title: Text("City name"),
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          actions: [
            Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          ]),
      body: Column(
        //display city name, weather condition, image, humidity, feelslike,uv, wind_dir, degree, pressure
        children: [
          // Image.network(),
        ],
      ),
    );
  }
}
