import 'dart:convert';

import 'package:flutter_weather_api/models/weather_model.dart';
import 'package:http/http.dart' as http;

Future<Weather> getWeatherData(String city) async {
  final url = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=14351aad1ca742f5ad1160401230711&q=$city&aqi=no');
  final response = await http.post(url);
  final decodResponse = jsonDecode(response.body);
  final weatherObject = Weather.fromJson(decodResponse);

  //print(weatherObject.location!.name!);
  return weatherObject;
}
