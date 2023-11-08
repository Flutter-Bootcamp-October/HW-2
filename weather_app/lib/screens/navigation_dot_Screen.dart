
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
        marginR: const EdgeInsets.symmetric(horizontal: 85, vertical: 30),
        curve: Curves.fastLinearToSlowEaseIn,
        backgroundColor: Colors.grey.shade100.withOpacity(0.15),
        currentIndex: _currentIndex,
        onTap: changePage,
        dotIndicatorColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}
