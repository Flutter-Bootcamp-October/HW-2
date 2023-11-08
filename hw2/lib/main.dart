import 'package:flutter/material.dart';
import 'package:hw2/bottom_nav_bar.dart';
import 'package:hw2/data/global.dart';

import 'package:hw2/services/weather_api.dart';

import 'models/weather_model.dart';

Weather? defaultCountry;
// List<Weather> listOfCountries = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  defaultCountry = await getCityByName("Riyadh");
  listOfCountries.value.add(defaultCountry!);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const CustomBottomNavBar()
        // const HomeScreen(),
        );
  }
}
