import 'package:flutter/material.dart';
import 'package:weather_app/data/global_data.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/widgets/background.dart';
import 'package:weather_app/widgets/info_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cityController = TextEditingController(text: 'Riyadh');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Background(
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
                      style: const TextStyle(color: Colors.white),
                      controller: cityController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 63, 69, 118)
                              .withOpacity(0.4),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          suffixIcon: const Icon(
                            Icons.location_on_outlined,
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
                                  top: 30,
                                  left: 10,
                                  child: Text(
                                    '${snapshot.data!.current!.tempC}°',
                                    style: const TextStyle(
                                        fontSize: 40, color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                  top: 139,
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
                                  top: 110,
                                  left: 290,
                                  child: InkWell(
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      objectList.add(snapshot.data!);
                                    },
                                    child: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 140,
                                  left: 240,
                                  child: Text(
                                    '${snapshot.data!.current!.condition!.text}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                                const Positioned(
                                  top: 20,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InfoContainer(),
                                      InfoContainer(),
                                      InfoContainer(),
                                      InfoContainer(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot);
                          return const Text("Error");
                        }
                        return const Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
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
