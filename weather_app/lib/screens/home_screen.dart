import 'package:flutter/material.dart';
import 'package:weather_app/components/favourite_city.dart';
import 'package:weather_app/data/globally.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141441),
      // backgroundColor: widget.weather.current!.isDay == 1
      //     ? const Color.fromARGB(117, 187, 222, 251)
      //     : const Color(0xff141441),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Weather App"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 35,

            ),
            Text(
              "Favourite Cities",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
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
