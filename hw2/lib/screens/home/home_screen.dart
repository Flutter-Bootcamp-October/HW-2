import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/extentions/size_extention.dart';
import 'package:hw2/models/weather_model.dart';
import 'package:hw2/services/weather_api.dart';

import 'components/weather_country_state.dart';
import 'components/weather_forecast_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getHeight(),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            colorsSwatch[1],
            colorsSwatch[6],
            colorsSwatch[5],
            colorsSwatch[4],
            colorsSwatch[6],
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const Center(
          child: Column(
            children: [
              WeatherCountryState(),
              Spacer(),
              WeatherForecastRow(),
            ],
          ),
        ),
      ),
    );
  }
}
