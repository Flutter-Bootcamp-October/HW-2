import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';
import 'package:weathet_app/models/weather.dart';

class DetalsScreen extends StatelessWidget {
  const DetalsScreen({super.key, required this.city});

  final Weather city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
          colors: city.current!.isDay == 1
              ? [
                  Color(0xff2DC8EA),
                  Color(0xff33AADD),
                  Color(0xff29B2DD),
                ]
              : [
                  Color(0xff0B42AB),
                  Color(0xff134CB5),
                  Color(0xff08244F),
                ],
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 300, top: 90),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text(
                      city.location!.name ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: city.current!.isDay == 1
                            ? Lottie.asset(
                                "assets/Animation - 1699474373667.json")
                            : Lottie.asset(
                                "assets/Animation - 1699475914457.json")),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      city.current!.tempC.toString() ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(city.current!.condition!.text ?? "",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlassmorphicContainer(
                    width: 100,
                    height: 120,
                    borderRadius: 20,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 0,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.5),
                          Color(0xFFFFFFFF).withOpacity(0.3),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(city.current!.humidity.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                              height: 50,
                              width: 50,
                              child:
                                  Image.asset("assets/WeatherIcon - 1-28.png")),
                          SizedBox(
                            height: 10,
                          ),
                          Text("HUMIDILTY",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  GlassmorphicContainer(
                    width: 100,
                    height: 120,
                    borderRadius: 20,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 0,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.5),
                          Color(0xFFFFFFFF).withOpacity(0.3),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(city.current!.feelslikeC.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                              height: 50,
                              width: 50,
                              child:
                                  Image.asset("assets/WeatherIcon - 1-3.png")),
                          SizedBox(
                            height: 10,
                          ),
                          Text("FEELS LIKE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                  GlassmorphicContainer(
                    width: 100,
                    height: 120,
                    borderRadius: 20,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 0,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.5),
                          Color(0xFFFFFFFF).withOpacity(0.3),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(city.current!.windKph.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/WeatherIcon - 1-6.png"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("WIND",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlassmorphicContainer(
                  width: 100,
                  height: 120,
                  borderRadius: 20,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color(0xFFFFFFFF).withOpacity(0.3),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(city.current!.precipIn.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/insurance 1.png")),
                        SizedBox(
                          height: 10,
                        ),
                        Text("PRECIP-IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                GlassmorphicContainer(
                  width: 100,
                  height: 120,
                  borderRadius: 20,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color(0xFFFFFFFF).withOpacity(0.3),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(city.current!.cloud.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child:
                                Image.asset("assets/WeatherIcon - 1-41.png")),
                        SizedBox(
                          height: 10,
                        ),
                        Text("CLOUD",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ),
                GlassmorphicContainer(
                  width: 100,
                  height: 120,
                  borderRadius: 20,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color(0xFFFFFFFF).withOpacity(0.3),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(city.current!.pressureIn.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/Pressure Gauge.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("PRESSURE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
