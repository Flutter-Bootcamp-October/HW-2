import 'package:flutter/material.dart';
import 'package:flutter_weather_api/models/weather_model.dart';
import 'package:lottie/lottie.dart';

class PicWeather extends StatelessWidget {
  const PicWeather({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      weather.current!.condition!.text!.contains('Sunny') &&
              weather.current!.isDay == 1
          ? Lottie.network(
              'https://lottie.host/e080f028-c29e-4a8b-b4fa-4136c7a6e496/2QT2nwPym3.json',
              height: 500,
              width: 500)
          : weather.current!.condition!.text!.contains("Clear") &&
                  weather.current!.isDay == 0
              ? Lottie.network(
                  'https://lottie.host/ba24cc24-90af-4cd9-b770-6626b3539826/FqpgLNr1tt.json',
                  height: 500,
                  width: 500)
              : weather.current!.condition!.text!.contains('rain') ||
                      weather.current!.condition!.text!.contains('drizzle') ||
                      weather.current!.condition!.text!.contains('sleet') &&
                          weather.current!.isDay == 0
                  ? Lottie.network(
                      'https://lottie.host/c2265470-7bd5-4c61-927a-c77b15127cb6/nUocFgpfcC.json',
                      height: 500,
                      width: 500)
                  : weather.current!.condition!.text!.contains('rain') ||
                          weather.current!.condition!.text!
                              .contains('drizzle') ||
                          weather.current!.condition!.text!.contains('sleet') &&
                              weather.current!.isDay == 1
                      ? Lottie.network(
                          'https://lottie.host/df37047e-cdd8-4f25-87e4-b5028bd5653f/JJdwbWVfOK.json',
                          height: 500,
                          width: 500)
                      : weather.current!.condition!.text!.contains('Cloudy') ||
                              weather.current!.condition!.text!
                                  .contains('Overcast')
                          ? Lottie.network(
                              'https://lottie.host/46b655bd-a850-4d28-a0e8-c2ce7a8b5314/RpF0sWCzwN.json',
                              height: 500,
                              width: 500)
                          : weather.current!.condition!.text!.contains('snow')
                              ? Lottie.network(
                                  'https://lottie.host/bb3db12f-7ea5-4e89-8c29-91faed533c2d/PZhtMz6dkC.json',
                                  height: 500,
                                  width: 500)
                              : weather.current!.condition!.text!
                                      .contains('thunder')
                                  ? Lottie.network('https://lottie.host/1d2ba0d2-8cff-4916-8ab6-89fb49c30bde/ZA9duzlMTC.json', height: 500, width: 500)
                                  : weather.current!.condition!.text!.contains('Partly') && weather.current!.isDay == 1
                                      ? Lottie.network('https://lottie.host/183df154-ec75-4b26-9dcc-d566a02a22cf/iECXK2otFZ.json', height: 500, width: 500)
                                      : weather.current!.condition!.text == 'Partly Cloudy' && weather.current!.isDay == 0
                                          ? Lottie.network('https://lottie.host/183df154-ec75-4b26-9dcc-d566a02a22cf/iECXK2otFZ.json', height: 500, width: 500)
                                          : Lottie.network('https://lottie.host/e080f028-c29e-4a8b-b4fa-4136c7a6e496/2QT2nwPym3.json', height: 500, width: 500)
    ]);
  }
}
