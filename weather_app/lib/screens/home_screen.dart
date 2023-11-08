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
                color = Color.fromARGB(255, 140, 176, 226);
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
            //show No city added when list is empty
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (favouriteList.isEmpty) {
                  return Center(child: Text("No City added"));
                } else {
                  return FavouriteCity(weather: favouriteList[index]);
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
