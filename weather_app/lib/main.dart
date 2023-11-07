import 'package:flutter/material.dart';

import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/weather_details_screen.dart';
import 'package:weather_app/services/api_server.dart';

import 'package:weather_app/screens/search_city.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {


  
    return const MaterialApp(
      home: SearchCity(),
    );


  }
}
