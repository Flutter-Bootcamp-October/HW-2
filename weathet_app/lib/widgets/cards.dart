import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
            width: 350,
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
              child: Stack(
                children: [
                  Card(
                    color: city.current!.isDay == 1
                        ? const Color(0xff536F9E)
                        : const Color(0xff21263C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      city.location!.name ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    city.location!.localtime ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                city.current!.tempC!.toInt().toString() ?? "",
                                style: const TextStyle(
                                    fontSize: 50, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(city.current!.condition!.text ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 100,
                      top: 25,
                      child: city.current!.isDay == 1
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: Lottie.asset(
                                  "assets/Animation - 1699476919686.json"))
                          : SizedBox(
                              height: 100,
                              width: 100,
                              child: Lottie.asset(
                                  "assets/Animation - 1699515864514.json")))
                ],
              ),
            ),
          )
        : const Text("");
  }
}
