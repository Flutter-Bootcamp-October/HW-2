import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

dynamic getCityByName(String city) async {
  final url = Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=aa0a7e08d5ca4302adb102712230811&q=$city&days=1");
  final response = await http.get(url);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return Weather.fromJson(decodedResponse);
  } else {
    return "bad";
  }
}
