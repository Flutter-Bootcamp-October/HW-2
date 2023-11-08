import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
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

////add to search list and display down the search bar in this screen
class _SearchCityState extends State<SearchCity> {
  TextEditingController cityController = TextEditingController(text: 'London');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff141441),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              TextField(
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100.withOpacity(0.1),
                  filled: true,
                  hintText: 'London',
                  suffix: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      cityController;
                      setState(() {});
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                ),
                controller: cityController,
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
