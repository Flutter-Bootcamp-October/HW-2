import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';

class ApiService {
  final apiBaseUrl =
      'https://api.weatherapi.com/v1/current.json?key=0a578587d2d94ef5a63140458230711&q=';
  Future<Weather> getWeatherData(String city) async {
    final url = Uri.parse(apiBaseUrl + city);
    final response = await http.get(url);
    var data = jsonDecode(response.body);
    var weatherObject = Weather.fromJson(data);
    print(response.body);
    return weatherObject;
  }
}
