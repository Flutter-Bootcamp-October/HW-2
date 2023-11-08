import 'package:flutter/material.dart';
import 'package:weather_app/data/globally.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screens/home_screen.dart';

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
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
      body: Padding(
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
                Container(
                  height: 175,
                  width: 165,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.white.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "wind",
                              style: TextStyle(fontSize: 20),
                            ),
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/54/54298.png",
                              height: 30,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "speed: ${widget.weather.current!.windMph}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "deg: ${widget.weather.current!.windDegree}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "DIR: ${widget.weather.current!.windDir}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 175,
                  width: 165,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.white.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "degree",
                              style: TextStyle(fontSize: 20),
                            ),
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/103/103945.png",
                              height: 30,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "feels like: ${widget.weather.current!.feelslikeC}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "humidity: ${widget.weather.current!.humidity}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
