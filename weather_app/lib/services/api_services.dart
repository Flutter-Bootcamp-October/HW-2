import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

// function return check for code
// Future<List> getWeatherOf(String city) async {
//   List responseList = [];
//   final usrl = Uri.parse(
//       'http://api.weatherapi.com/v1/current.json?key=c8ada8b610ab426a805155845230711&q=$city&aqi=no');
//   final response = await http.get(usrl);
//   if (response.statusCode == 200) {
//     responseList.add("OK"); //adding validation to list
//     final response = await http.get(usrl);
//     final decodedResponse = jsonDecode(response.body);
//     responseList.add(decodedResponse); //adding
//   } else {
//     responseList.add("Failed");
//   }
//   return responseList;
// }

Future getWeather(String city) async {
  Weather cityObject;
  final url = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=c8ada8b610ab426a805155845230711&q=$city&aqi=no');
  final response = await http.get(url);
  final code = response.statusCode;
  final decodedResonse = jsonDecode(response.body);
  if (code == 200) {
    print("OK");
    cityObject = Weather.fromJson(decodedResonse);
  } else {
    print(decodedResonse["error"]["message"]);
  }
}
