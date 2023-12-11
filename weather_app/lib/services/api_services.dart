import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

Future<List> getWeatherOf(String city) async {
  List responseList = [];
  Weather cityObject;
  final url = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=c8ada8b610ab426a805155845230711&q=$city&aqi=no');
  final response = await http.get(url);
  final code = response.statusCode;
  final decodedResonse = jsonDecode(response.body);
  if (code == 200) {
    responseList.add("OK");
    cityObject = Weather.fromJson(decodedResonse);
    responseList.add(cityObject);
  } else {
    responseList.add(decodedResonse["error"]["message"]);
  }
  return responseList;
}
