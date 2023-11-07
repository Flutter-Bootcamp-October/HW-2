import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_city.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

int _currentIndex = 0;

class _NavigationScreenState extends State<NavigationScreen> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [
    const HomeScreen(),
    const SearchCity(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        curve: Curves.fastLinearToSlowEaseIn,
        backgroundColor: const Color.fromARGB(255, 128, 253, 255),
        currentIndex: _currentIndex,
        onTap: changePage,
        dotIndicatorColor: const Color(0xff233b67),
        items: [
          DotNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              selectedColor: const Color(0xff233b67),
              unselectedColor: const Color(0xff233b67)),
          DotNavigationBarItem(
              icon: const Icon(Icons.search),
              selectedColor: const Color(0xff233b67),
              unselectedColor: const Color(0xff233b67)),
          DotNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              selectedColor: const Color(0xff233b67),
              unselectedColor: const Color(0xff233b67)),
          DotNavigationBarItem(
              icon: const Icon(Icons.add_circle_outline),
              selectedColor: const Color(0xff233b67),
              unselectedColor: const Color(0xff233b67)),
        ],
      ),
    );
  }
}
