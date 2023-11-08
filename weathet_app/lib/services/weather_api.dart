import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathet_app/models/weather.dart';

Future<Weather?> getCityData(String city) async {
  final url = Uri.parse(
      "http://api.weatherapi.com/v1/current.json?key=5556a946b237427c899101043230811&q=$city");
  final response = await http.get(url);
  print(response.body);
  if (response.statusCode == 200) {
    final responseDecode = jsonDecode(response.body);
    final weatherObject = Weather.fromJson(responseDecode);
    return weatherObject;
  } else {
    return null;
  }
}
