import 'package:flutter/material.dart';
import 'package:weather_app/components/favourite_city.dart';
import 'package:weather_app/data/globally.dart';

Color color = const Color(0xff141441);
bool onColor = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        actions: [
          Switch(
            value: onColor,
            onChanged: (value) {
              if (onColor == true) {
                color = Colors.blueAccent;
              } else {
                color = const Color(0xff141441);
              }
              onColor = value;
              setState(() {});
            },
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Weather App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Favourite Cities",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            //make list clickable to view details
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (favouriteList.isNotEmpty) {
                  return FavouriteCity(weather: favouriteList[index]);
                } else {
                  const Text("No City added");
                }
              },
              itemCount: favouriteList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
