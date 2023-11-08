

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
        actions: const [
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: 8,
              )
            ],
          )
        ],
        title: const Text("Weather App"),
      ),
      body: const Column(
        children: [Text("Favourite ")],
      ),
    );
  }
}
