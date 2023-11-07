import 'package:http/http.dart' as http;

// function return check for code status
Future getWeather(String city) async {
  final usrl = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=c8ada8b610ab426a805155845230711&q=$city&aqi=no');
  final response = await http.get(usrl);
  if (response.statusCode == 200) {
    return "OK";
  }
  return "Failed";
  // final decodedResponse = jsonDecode(response.body);
  // return Weather.fromJson(decodedResponse);
}
