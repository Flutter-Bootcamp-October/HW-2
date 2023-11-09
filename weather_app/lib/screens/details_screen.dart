/*
now we use currentCity
  - add to weatherList if user click button and currentCity not in weather list. 
1. background: currentCity.current.isDay == 0 ? dark : light
2. GridView:
 - widget(icon : water, String: "humidety", body: )
*/

import 'package:flutter/material.dart';
import 'package:weather_app/global/global.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/widgets/details_card_title_widget.dart';
import 'package:weather_app/widgets/details_card_widget.dart';

class DetilesScreen extends StatelessWidget {
  DetilesScreen({super.key});
  String conditionText = "lightnig" /*currentCity.current!.condition!.text!*/;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: currentCity.current!.isDay! == 0
                    ? [const Color(0xff536976), const Color(0xff292E49)]
                    : [const Color(0xff00D2FF), const Color(0xff3A7BD5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 340,
            child: IconButton(
              onPressed: () {
                if (cityList.contains(currentCity.location.name)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "${currentCity.location!.name!} is already saved")));
                } else {
                  cityList.add(currentCity.location.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }
              },
              icon: const Icon(
                Icons.bookmark_add_outlined,
                color: Colors.white,
                size: 32,
              ),
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (conditionText == "sunny")
                      Image.network(
                        "https://cdn1.iconfinder.com/data/icons/weather-624/64/Weather_Sun_warm_weather_icon-512.png",
                        width: 100,
                        height: 100,
                      )
                    else if (conditionText == "cloudy")
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/6889/6889878.png",
                        width: 100,
                        height: 100,
                      )
                    else if (conditionText == "stormy")
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/4005/4005782.png",
                        width: 100,
                        height: 100,
                      )
                    else if (conditionText == "rainy")
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/8647/8647888.png",
                        width: 100,
                        height: 100,
                      )
                    else if (conditionText == "windy")
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/2264/2264653.png",
                        width: 100,
                        height: 100,
                      )
                    else if (conditionText == "lightnig")
                      Image.network(
                        "https://cdn1.iconfinder.com/data/icons/weather-forecast-meteorology-color-1/128/weather-thunderstorm-512.png",
                        width: 100,
                        height: 100,
                      ),
                    Text(
                      currentCity.location!.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      "${currentCity.current!.tempC!.toInt()}°",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontWeight: FontWeight.w100),
                    ),
                    Text(
                      currentCity.current!.condition!.text!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 360,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  DetailCard(
                      cardtitle: "UV INDEX",
                      cardIcon: Icons.sunny,
                      cardValue: currentCity.current!.uv!.toString()),
                  const SizedBox(
                    width: 12,
                  ),
                  DetailCard(
                    cardtitle: "WIND Speed",
                    cardIcon: Icons.air,
                    cardValue: currentCity.current!.windKph!.toString(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 560,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  DetailCard(
                    cardtitle: "HUMIDITY",
                    cardIcon: Icons.water,
                    cardValue: currentCity.current!.humidity!.toString(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  DetailCard(
                      cardtitle: "Wind Direction",
                      cardIcon: Icons.air,
                      cardValue: currentCity.current!.pressureIn!.toString())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
