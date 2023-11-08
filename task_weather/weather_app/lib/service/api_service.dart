import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/data_model.dart';

Future<Weather> getDataId(String city) async {
  final urlGetDataAll = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=e690ecc2e8ff4b7c83e174357230711&q=/$city');

  final response = await http.get(urlGetDataAll);
  final responseId = jsonDecode(response.body);
  print(responseId);
  final weatherObject = Weather.fromJson(responseId);

  return weatherObject;
}
