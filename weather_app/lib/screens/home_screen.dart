import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/functions/get_weather_image.dart';
import 'package:weather_app/models/glopals.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/services/api/get_riyadh_weather.dart';
import 'package:weather_app/services/api/get_weather_data_by_city.dart';
import 'package:weather_app/widgets/weather_details.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key, this.city});
  String? city;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8d8d9),
      body: SafeArea(
        child: FutureBuilder<Weather>(
          future: cityList.length > 0
              ? getWeatherData(currentCity)
              : getRiyadhWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error'));
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.52,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: snapshot.data!.current!.isday == 1
                          ? Color(0xff85CDFD)
                          : Color(0xff0C356A),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 260,
                          top: 100,
                          child: Image.asset(snapshot.data!.current!.isday == 0
                              ? 'lib/assets/icons/clear-night.png'
                              : 'lib/assets/images/clear-day.png'),
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            child: Column(
                              children: [
                                Container(width: double.infinity),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  snapshot.data!.location!.name.toString(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  snapshot.data!.location!.country.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: snapshot.data!.current!.tempC
                                            .toStringAsFixed(0),
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'C',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  snapshot.data!.current!.condition.text
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '${DateFormat('jm').format(DateTime.parse('2023-11-09 07:25'))}',
                                  /*The code is correct, but the api does not follow the time date standard (2023-11-09 06:04) it gives (2023-11-09 6:04)*/
                                  // '${DateFormat('jm').format(DateTime.parse(snapshot.data!.location!.localtime.toString()))}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.95,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        // 1
                                        WeatherDetails(
                                          icon: 'lib/assets/icons/wind.png',
                                          text: 'Wind Speed',
                                          info: snapshot
                                              .data!.current!.windSpeed
                                              .toString(),
                                          unit: ' Km',
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                        // 2
                                        WeatherDetails(
                                          icon:
                                              'lib/assets/icons/wind-rose.png',
                                          text: 'Wind Direction',
                                          info: snapshot.data!.current!.windDir,
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                        // 3
                                        WeatherDetails(
                                          icon:
                                              'lib/assets/icons/thermometer.png',
                                          text: 'Humidity',
                                          info: snapshot.data!.current!.Humidity
                                              .toString(),
                                          unit: ' %',
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                        // 4
                                        WeatherDetails(
                                          icon:
                                              'lib/assets/icons/temperature.png',
                                          text: 'Feels like ',
                                          info: snapshot
                                              .data!.current!.feelslikeC
                                              .toString(),
                                          unit: ' C',
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                        // 5
                                        WeatherDetails(
                                          icon: 'lib/assets/icons/witness.png',
                                          text: 'Visibility ',
                                          info: snapshot
                                              .data!.current!.visibility
                                              .toString(),
                                          unit: ' Km',
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                        // 6
                                        WeatherDetails(
                                          icon: 'lib/assets/icons/gauge.png',
                                          text: 'Pressure',
                                          info: snapshot
                                              .data!.current!.pressureMb
                                              .toString(),
                                          unit: ' mb',
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                        // 7
                                        WeatherDetails(
                                          icon:
                                              'lib/assets/icons/ultraviolet.png',
                                          text: 'UV',
                                          info: snapshot.data!.current!.uv
                                              .toString(),
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                        // 8
                                        WeatherDetails(
                                          icon: getWeatherImage(snapshot.data!
                                              .current!.condition.code!)[2],
                                          text: 'Temp in F',
                                          info: snapshot.data!.current!.tempf
                                              .toString(),
                                          unit: ' F',
                                          color: snapshot
                                                      .data!.current!.isday ==
                                                  1
                                              ? Color.fromARGB(255, 77, 76, 76)
                                              : Colors.grey[300],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 16,
                              child: Image.asset(
                                snapshot.data!.current!.condition.code ==
                                            1000 &&
                                        snapshot.data!.current!.condition
                                                .code! >
                                            20
                                    ? 'lib/assets/images/hot-cuate.png'
                                    : snapshot.data!.current!.condition.code! >
                                                1002 &&
                                            snapshot.data!.current!.condition
                                                    .code! <
                                                1066
                                        ? 'lib/assets/images/Raining-cuate.png'
                                        : snapshot.data!.current!.condition
                                                        .code! >
                                                    1065 &&
                                                snapshot.data!.current!
                                                        .condition.code! <
                                                    1117
                                            ? 'lib/assets/images/Snowman-cuate.png'
                                            : 1 > 0
                                                ? ''
                                                : 'lib/assets/images/Winter-road-bro.png',
                                width: MediaQuery.sizeOf(context).width * 0.95,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
