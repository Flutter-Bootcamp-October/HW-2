import 'package:flutter/material.dart';
import 'package:weather_app/components/city_container.dart';
import 'package:weather_app/model/weather.dart';

class FavouriteCity extends StatefulWidget {
  const FavouriteCity({super.key, required this.weather});

  final Weather weather;

  @override
  State<FavouriteCity> createState() => _FavouriteCityState();
}

class _FavouriteCityState extends State<FavouriteCity> {
  @override
  Widget build(BuildContext context) {
    return CityContainer(
      condetion: widget.weather.current!.isDay == 0,
      cityName: "${widget.weather.location!.name}",
      weatherCondetion: "${widget.weather.current!.condition?.text}",
      temp: "${widget.weather.current!.tempC}",
      iconURL: 'https:${widget.weather.current!.condition?.icon}',
    );
  }
}
