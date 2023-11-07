import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//display favourite city's list
//
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
