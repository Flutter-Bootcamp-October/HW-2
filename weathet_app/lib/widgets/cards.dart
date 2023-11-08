import 'package:flutter/material.dart';
import 'package:weathet_app/models/weather.dart';
import 'package:weathet_app/screens/detials_screen.dart';

class CardsWeather extends StatelessWidget {
  const CardsWeather({
    super.key,
    required this.city,
  });

  final Weather city;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 370,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalsScreen(),
              ));
        },
        child: Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "London",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Text(
                          "10:30pm",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      "21",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text("Mostly clear",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white)),
                    SizedBox(
                      width: 160,
                    ),
                    Text("H:30",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("L:18",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
