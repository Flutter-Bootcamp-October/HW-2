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
  const DetilesScreen({super.key});

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
                if (weatherList.contains(currentCity)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "${currentCity.location!.name!} is already saved")));
                } else {
                  weatherList.add(currentCity);
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
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Image.asset("weather_app/assets/moon.png"),
                    Text(
                      currentCity.location!.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      "${currentCity.current!.tempC!} °",
                      style: TextStyle(
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
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  DetailCard(
                      cardtitle: "UV INDEX",
                      cardImage: "weather_app/assets/detile_humidity.png",
                      cardValue: currentCity.current!.uv!.toString()),
                  SizedBox(
                    width: 12,
                  ),
                  DetailCard(
                    cardtitle: "WIND",
                    cardImage: "weather_app/assets/detile_humidity.png",
                    cardValue: currentCity.current!.windKph!.toString(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 560,
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  DetailCard(
                    cardtitle: "HUMIDITY",
                    cardImage: "weather_app/assets/detile_humidity.png",
                    cardValue: currentCity.current!.humidity!.toString(),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  DetailCard(
                      cardtitle: "Pressure",
                      cardImage: "weather_app/assets/detile_humidity.png",
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
