import 'package:flutter/material.dart';
import 'package:weather_app/data/global_data.dart';
import 'package:weather_app/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController cityController = TextEditingController(text: 'London');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                Color(0xff2E3358),
                Color(0xff3b3781),
                // Color(0xff6449aa),
                // Color(0xff7f50ae),
                // Color(0xff9047ac),
              ])),
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 70, left: 20),
                      child: Text(
                        'Weather',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 63, 69, 118),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search for a city',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ),
                    FutureBuilder(
                      future: getDataId(cityController.text),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/Rectangle.png'),
                                Positioned(
                                  top: 80,
                                  left: 10,
                                  child: Text(
                                    '${snapshot.data!.current!.tempC}°',
                                    style: const TextStyle(
                                        fontSize: 40, color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                    left: 133,
                                    bottom: 45,
                                    width: 263,
                                    height: 130,
                                    child: Image.asset(weatherStatus[snapshot
                                        .data!.current!.condition!.text])),
                                Positioned(
                                  top: 147,
                                  left: 10,
                                  child: Row(
                                    children: [
                                      Text(
                                        '${snapshot.data!.location!.name},',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '${snapshot.data!.location!.country}',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  left: 290,
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 150,
                                  left: 240,
                                  child: Text(
                                    '${snapshot.data!.current!.condition!.text}',
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot);
                          return const Text("Error");
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
      ],
    ));
  }
}
