import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/extentions/size_extention.dart';
import 'package:hw2/screens/home/home_screen.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/rendering.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),

      // backgroundColor: colorsSwatch[6],
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   backgroundColor: colorsSwatch[6],
      //   icons: const [
      //     Icons.explore_outlined,
      //     Icons.settings_outlined,
      //   ],
      //   gapLocation: GapLocation.center,
      //   activeIndex: selectedIndex,
      //   notchSmoothness: NotchSmoothness.sharpEdge,
      //   onTap: (index) => setState(() {
      //     selectedIndex = index;
      //     setState(() {});
      //   }),
      // ),
    );
  }
}
