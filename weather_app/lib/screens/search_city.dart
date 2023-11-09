import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';

import 'package:weather_app/screens/weather_details_screen.dart';
import 'package:weather_app/services/api_server.dart';

import '../components/city_container.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({
    super.key,
  });

  @override
  State<SearchCity> createState() => _SearchCityState();
}

bool day = true;

////add to search list and display down the search bar in this screen
class _SearchCityState extends State<SearchCity> {
  TextEditingController cityController = TextEditingController(text: 'London');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.white10,
                            blurStyle: BlurStyle.inner)
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.74,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      autofocus: false,
                      decoration: InputDecoration(
                        
                        fillColor: Colors.grey.shade50.withOpacity(0.1),
                        filled: true,
                        hintText: 'London',
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                      ),
                      controller: cityController,
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 60,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.white10.withOpacity(0.1),
                                blurStyle: BlurStyle.inner)
                          ],
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100.withOpacity(0.1)),
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          cityController = cityController;
                          setState(() {});
                        },
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                  future: getWeatherData(cityController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WeatherDetailsScreen(
                                      weather: snapshot.data!)));
                        },
                        child: CityContainer(
                          condetion: snapshot.data!.current!.isDay == 0,
                          cityName: '${snapshot.data!.location!.name}',
                          weatherCondetion:
                              '${snapshot.data!.current!.condition?.text}',
                          temp: '${snapshot.data!.current!.tempC}',
                          iconURL:
                              'https:${snapshot.data!.current!.condition?.icon}',
                        ),
                      );
                    } else if (snapshot.hasError) {
                      const Text("error");
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        )));
  }
}
