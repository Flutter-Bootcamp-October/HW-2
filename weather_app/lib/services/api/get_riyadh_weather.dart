import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/models.dart';

Future<Weather> getRiyadhWeather() async {
  final url = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=1655e996773249af82e181850230711&q=Riyadh&aqi=no');
  final response = await http.get(url);
  final decodedResponse = jsonDecode(response.body);
  final weatherObject = Weather.fromJson(decodedResponse);

  if (decodedResponse == null) {
    throw Exception('Failed to decode response');
  }

  return weatherObject;
}
