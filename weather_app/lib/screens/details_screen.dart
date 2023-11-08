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

class DetilesScreen extends StatelessWidget {
  const DetilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: currentCity.current!.isDay! == 0
                ? [Color(0xff536976), Color(0xff292E49)]
                : [Color(0xff00D2FF), Color(0xff3A7BD5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Container(
              child: Column(children: [
                Image.asset("weather_app/assets/moon.png"),
                Text(
                  currentCity.location!.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const Text(
                  "22",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.w100),
                ),
                const Text(
                  "Cloudy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          ),
        ),
      )
    ]));
  }
}





/* is day 0 = dark */