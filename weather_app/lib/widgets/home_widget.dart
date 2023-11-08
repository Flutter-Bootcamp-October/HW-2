/*
attribute Weather object
- Weather.location.name
    - Weather.location.country
    - Weather.location.localtime
    - Weather.current.tempC
    - Weather.current.isDay
    - Weather.current.condtion.text
*/

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.city});
  final Weather city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          // height: MediaQuery.of(context).size.height / .23,
          height: 130,
          width: MediaQuery.of(context).size.width - 100,
          color: city.current!.isDay! == 1
              ? Colors.lightBlue
              : const Color.fromARGB(255, 1, 34, 49),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(city.location!.name!),
                    Text(getHour(city.location!.localtime!)),
                    Text(city.current!.condition!.text!),
                  ],
                ),
                Text((city.current!.tempC!).toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getHour(String s) {
    List l = s.split(" ");
    return l[1];
  }
}
