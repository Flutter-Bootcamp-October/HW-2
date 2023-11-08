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
    return city != null
        ? SizedBox(
            height: 130,
            width: 370,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalsScreen(
                        city: city,
                      ),
                    ));
              },
              child: Card(
                color: city.current!.isDay == 1 ? Colors.amber : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                city.location!.name ?? "",
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                              const Text(
                                "10:30pm",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 110,
                          ),
                          Text(
                            city.current!.tempC.toString() ?? "",
                            style: const TextStyle(
                                fontSize: 50, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(city.current!.condition!.text ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(
                            width: 160,
                          ),
                          const Text("H:30",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("L:18",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const Text("");
  }
}
