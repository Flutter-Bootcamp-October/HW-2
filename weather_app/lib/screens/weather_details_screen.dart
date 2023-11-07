import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';

class WeatherDetailsScreen extends StatefulWidget {
  const WeatherDetailsScreen({
    super.key,
    required this.weather,
  });
  final Weather weather;
  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.weather.current!.isDay == 1
          ? const Color.fromARGB(138, 13, 72, 161)
          : const Color.fromARGB(117, 187, 222, 251),
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //display city name, weather condition, image, humidity, feelslike,uv, wind_dir, degree, pressure
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                      "${widget.weather.location!.name},${widget.weather.location!.region}"),
                  Spacer(),
                  Text("${widget.weather.current!.lastUpdated}")
                ],
              ),

              Image.network("${widget.weather.current!.condition!.icon}"),
              Text("${widget.weather.current!.tempC}")
              // Image.network(),
            ],
          ),
        ),
      ),
    );
  }
}
