
import 'package:flutter/material.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/services/api/get_weather_data_by_city.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weatherData,
  });

  final Weather weatherData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                if (weatherData.current.isday == 0)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                        getWeatherImage(weatherData.current.condition.code)[0]),
                  ),
                if (weatherData.current.isday == 1)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                        getWeatherImage(weatherData.current.condition.code)[2]),
                  ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${weatherData.current.tempC}°C',
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    weatherData.location.region,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (weatherData.current.isday == 0)
            Positioned(
              right: 30,
              top: 0,
              child: Image.asset(
                getWeatherImage(weatherData.current.condition.code)[1],
                width: 80,
                height: 80,
              ),
            ),
          if (weatherData.current.isday == 1)
            Positioned(
              right: 30,
              top: 0,
              child: Image.asset(
                getWeatherImage(weatherData.current.condition.code)[3],
                width: 80,
                height: 80,
              ),
            )
        ],
      ),
    );
  }
}
