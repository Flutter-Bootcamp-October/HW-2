import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/glopals.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_screen.dart';

class WeatherNavigationBar extends StatefulWidget {
  const WeatherNavigationBar({super.key});

  @override
  State<WeatherNavigationBar> createState() => _WeatherNavigationBarState();
}

class _WeatherNavigationBarState extends State<WeatherNavigationBar> {
  var _selectedTab = _SelectedTab.home;
  int index = 0;
  List screen = [
    Home(city: currentCity),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screen[index],
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: Color.fromARGB(255, 42, 42, 41),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          unselectedItemColor: Colors.grey,
          onTap: (int i) {
            setState(() {
              index = i;
              _selectedTab = _SelectedTab.values[i];
            });
          },
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Colors.white,
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Colors.white,
            ),
          ],
        ));
  }
}

enum _SelectedTab { home, search }
