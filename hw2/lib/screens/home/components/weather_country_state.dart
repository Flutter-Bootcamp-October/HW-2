import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/extentions/size_extention.dart';
import 'package:hw2/main.dart';

import '../../manage_city/manage_city_screen.dart';

class WeatherCountryState extends StatefulWidget {
  const WeatherCountryState({
    super.key,
  });

  @override
  State<WeatherCountryState> createState() => _WeatherCountryStateState();
}

class _WeatherCountryStateState extends State<WeatherCountryState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(25),
          overlayColor: MaterialStatePropertyAll<Color>(colorsSwatch[1]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageCityScreen(),
                )).then((value) {
              setState(() {});
            });
          },
          child: Text(
            "${defaultCountry?.location?.name}",
            style: TextStyle(shadows: [
              Shadow(
                offset: const Offset(1.5, -2),
                blurRadius: 2.0,
                color: colorsSwatch[1],
              ),
            ], color: colorsSwatch[4], fontSize: 20),
          ),
        ),
        Text(" ${defaultCountry?.current?.tempC}°",
            style: TextStyle(
                shadows: [
                  Shadow(
                    offset: const Offset(2.5, 2.5),
                    blurRadius: 10.0,
                    color: colorsSwatch[1],
                  ),
                ],
                color: colorsSwatch[7],
                fontSize: 35,
                fontWeight: FontWeight.w500)),
        SizedBox(height: context.getHeight() * .01),
        Center(
          child: Image.asset(
            (defaultCountry?.current?.isDay == 0)
                ? "assets/images/weather_status/night_transparent.png"
                : "assets/images/weather_status/sunny.png",
            scale: 4,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Time:${defaultCountry?.location?.localtime!.substring(defaultCountry!.location!.localtime!.length - 5)}",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Humidity: ${defaultCountry?.current?.humidity}",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "Weather Condition: ${defaultCountry?.current?.condition?.text}",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}
