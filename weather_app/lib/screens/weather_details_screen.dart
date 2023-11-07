import 'package:flutter/material.dart';

class WeatherDetailsScreen extends StatefulWidget {
  const WeatherDetailsScreen({super.key});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //display city name, weather condition, image, humidity, feelslike,uv, wind_dir, degree, pressure
        children: [
          ElevatedButton(
            onPressed: () {
              //add to favourite and display on home screen
            },
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
