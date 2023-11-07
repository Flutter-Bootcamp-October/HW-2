import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// final Weather weather;
//display favourite city's list
//
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: widget.weather.current!.isDay == 1
      //     ? const Color.fromARGB(117, 187, 222, 251)
      //     : const Color(0xff141441),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: 8,
              )
            ],
          )
        ],
        title: Text("Weather App"),
      ),
      body: Column(
        children: [Text("Favourite ")],
      ),
    );
  }
}
