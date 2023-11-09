import 'package:flutter/material.dart';
import 'package:weather_app/data/condition.dart';
import 'package:weather_app/data/global_data.dart';
import 'package:weather_app/screen/favorite_screen.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/widgets/background.dart';
import 'package:weather_app/widgets/info_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Weather',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FavoriteScreen()));
                          },
                        )
                      ],
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
                    onSubmitted: (value) {
                      setState(() {});
                    },
                  ),
                  FutureBuilder(
                    future: getDataCity(cityController.text),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                              ),
                              Image.asset('assets/images/Rectangle.png'),
                              Positioned(
                                top: 30,
                                left: 10,
                                child: Text(
                                  '${snapshot.data['current']['temp_c']}°',
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                              Positioned(
                                  top: 3,
                                  left: 122,
                                  child: Image.asset(
                                    iconImage[snapshot.data['current']
                                        ['condition']['text']],
                                    width: 270,
                                    height: 120,
                                  )),
                              Positioned(
                                top: 139,
                                left: 10,
                                child: Row(
                                  children: [
                                    Text(
                                      '${snapshot.data!['location']['name']},',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '${snapshot.data!['location']['country']}',
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
                                  onTap: () {
                                    if (favoriteCities.contains(
                                        snapshot.data!['location']['name'])) {
                                      favoriteCities.remove(
                                          snapshot.data!['location']['name']);
                                    } else {
                                      favoriteCities.add(
                                          snapshot.data!['location']['name']);
                                    }
                                    setState(() {});
                                  },
                                  child: !favoriteCities.contains(
                                          snapshot.data!['location']['name'])
                                      ? const Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        )
                                      : const Icon(Icons.favorite,
                                          color: Colors.redAccent),
                                ),
                              ),
                              Positioned(
                                top: 140,
                                left: 240,
                                child: Text(
                                  '${snapshot.data!['current']['condition']['text']}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              Positioned(
                                top: 220,
                                child: Row(
                                  children: [
                                    InfoContainer(
                                        icon: Icons.wind_power,
                                        value: snapshot.data!['current']
                                            ['wind_mph']),
                                    const SizedBox(width: 32),
                                    InfoContainer(
                                        icon: Icons.water_drop_rounded,
                                        value: snapshot.data!['current']
                                            ['humidity']),
                                    const SizedBox(width: 32),
                                    InfoContainer(
                                        icon: Icons.cloud,
                                        value: snapshot.data!['current']
                                            ['cloud']),
                                    const SizedBox(width: 32),
                                    InfoContainer(
                                      icon: Icons.av_timer_rounded,
                                      value: snapshot.data!['current']
                                          ['pressure_mb'],
                                    ),
                                  ],
                                ),
                              ),
                              conditionImage.containsKey(snapshot
                                      .data!['current']['condition']['text'])
                                  ? Positioned(
                                      top: 400,
                                      left: 40,
                                      child: Opacity(
                                        opacity: 0.75,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            conditionImage[
                                                snapshot.data!['current']
                                                    ['condition']['text']],
                                            scale: 3,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Positioned(
                                      top: 400,
                                      left: 40,
                                      child: Opacity(
                                        opacity: 0.75,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            conditionImage["Sunny"],
                                            scale: 3,
                                          ),
                                        ),
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
            ),
          ),
        ),
      ],
    ));
  }
}
