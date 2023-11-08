import 'package:flutter/material.dart';
import 'package:weather_app/data/globally.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screens/home_screen.dart';

import '../components/weather_details_container.dart';

class WeatherDetailsScreen extends StatefulWidget {
  WeatherDetailsScreen({
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
          ? Colors.blue.withOpacity(0.7)
          : const Color(0xff141441),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    favouriteList.add(widget.weather);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Added to favorite "),
                          );
                        });
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ]),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //display city name, weather condition, image, humidity, feelslike,uv, wind_dir, degree, pressure
            children: [
              Center(
                child: Text(
                  "${widget.weather.current!.lastUpdated}",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 30,
                  ),
                  Flexible(
                    child: Text(
                      "${widget.weather.location!.name},",
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const Spacer(),
                  Image.network(
                    "https:${widget.weather.current!.condition!.icon}",
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 55,
                  ),
                  Flexible(
                    child: Text(
                      "${widget.weather.location!.region}",
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 85,
              ),
              // add image from list

              Center(
                child: Column(
                  children: [
                    Text(
                      "${widget.weather.current!.tempC}",
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${widget.weather.current!.condition!.text}",
                        style: const TextStyle(fontSize: 24)),
                  ],
                ),
              ),
              const SizedBox(
                height: 65,
              ),

              // add containers with wind data
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherDetailsContainer(
                    textEntry1: 'wind',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/54/54298.png',
                    textEntry2: "speed: ${widget.weather.current!.windMph}",
                    textEntry3: "deg: ${widget.weather.current!.windDegree}",
                    textEntry4: "DIR: ${widget.weather.current!.windDir}",
                  ),
                  WeatherDetailsContainer(
                    textEntry1: 'degree',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/103/103945.png',
                    textEntry2:
                        "feels like: ${widget.weather.current!.feelslikeC}",
                    textEntry3: "humidity: ${widget.weather.current!.humidity}",
                    textEntry4: "",
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherDetailsContainer(
                    textEntry1: 'pressure',
                    image:
                        'https://cdn-icons-png.flaticon.com/128/556/556958.png',
                    textEntry2:
                        "in mil.: ${widget.weather.current!.pressureMb}",
                    textEntry3: "in in.: ${widget.weather.current!.pressureIn}",
                    textEntry4: "",
                  ),
                  WeatherDetailsContainer(
                    textEntry1: 'other',
                    image:
                        'https://cdn-icons-png.flaticon.com/128/12614/12614409.png',
                    textEntry2: "cloud cover: ${widget.weather.current!.cloud}",
                    textEntry3: "UV: ${widget.weather.current!.uv}",
                    textEntry4: "",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
