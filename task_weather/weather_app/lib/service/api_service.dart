import 'dart:convert';
import 'package:http/http.dart' as http;

Future getDataId(String city) async {
  String key = "e690ecc2e8ff4b7c83e174357230711";
  final url =
      Uri.parse('http://api.weatherapi.com/v1/current.json?key=$key&q=/$city');

  final response = await http.get(url);
  final responseId = jsonDecode(response.body);
  print(responseId);
  return responseId;
}
