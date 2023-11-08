import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/api/get_weather_data_by_city.dart';
import 'package:weather_app/widgets/weather_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8d8d9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff605e79),
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
                      child: Image.asset('lib/assets/icons/clear-night.png'),
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
                              'Riyadh',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Saudi Arabia',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '23',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Clear',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${DateFormat('jm').format(DateTime.parse('2023-11-08 19:39'))}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 24),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.95,
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
                                      info: '11.2',
                                      unit: ' Km',
                                    ),
                                    // 2
                                    WeatherDetails(
                                      icon: 'lib/assets/icons/wind-rose.png',
                                      text: 'Wind Direction',
                                      info: 'N',
                                    ),
                                    // 3
                                    WeatherDetails(
                                      icon: 'lib/assets/icons/thermometer.png',
                                      text: 'Humidity',
                                      info: '24',
                                      unit: ' %',
                                    ),
                                    // 4
                                    WeatherDetails(
                                      icon: 'lib/assets/icons/temperature.png',
                                      text: 'Feels like ',
                                      info: '25.2',
                                      unit: ' C',
                                    ),
                                    // 5
                                    WeatherDetails(
                                      icon: 'lib/assets/icons/witness.png',
                                      text: 'Visibility ',
                                      info: '10',
                                      unit: ' Km',
                                    ),
                                    // 6
                                    WeatherDetails(
                                      icon: 'lib/assets/icons/gauge.png',
                                      text: 'Pressure ',
                                      info: '1090',
                                      unit: ' mb',
                                    ),
                                    // 7
                                    WeatherDetails(
                                      icon: 'lib/assets/icons/ultraviolet.png',
                                      text: 'UV',
                                      info: '1',
                                    ),
                                    // 8
                                    WeatherDetails(
                                      icon: 'lib/assets/icons/fahrenheit.png',
                                      text: 'Temp in F',
                                      info: '78.8',
                                      unit: ' F',
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
                            getWeatherImage(1063)[2].toString(),
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
        ),
      ),
    );
  }
}
