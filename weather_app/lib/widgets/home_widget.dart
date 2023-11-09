import 'package:flutter/material.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/global/global.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/details_screen.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.city});
  final Weather city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          currentCity = city;
          //push to details screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetilesScreen()),
          );
        },
        onLongPress: () {
          cityList.remove(city.location!.name!);
          // ignore: invalid_use_of_protected_member
          context.findAncestorStateOfType<HomeScreenState>()!.setState(() {});
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: city.current!.isDay! == 0
                        ? [const Color(0xff536976), const Color(0xff292E49)]
                        : [const Color(0xff00D2FF), const Color(0xff3A7BD5)])),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(city.location!.name!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Text(getHour(city.location!.localtime!),
                          style: const TextStyle(color: Colors.white)),
                      const Spacer(),
                      Text(city.current!.condition!.text!,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Text("${city.current!.tempC!.round()}°",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getHour(String s) {
    List l = s.split(" ");
    return l[1];
  }
}
