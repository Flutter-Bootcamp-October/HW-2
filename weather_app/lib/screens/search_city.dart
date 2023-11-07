import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_details_screen.dart';
import 'package:weather_app/services/api_server.dart';

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
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          autofocus: false,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 197, 244, 245),
            filled: true,
            label: const Text('Enter name of the city'),
            hintText: 'London',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
          ),
          controller: cityController,
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
                                  weather: snapshot.data!,
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child:  Card(
                      color: const Color.fromARGB(255, 36, 110, 110),
                      child: Column(children: [
                        Text('${snapshot.data!.location!.country}'),
                        Text('C ${snapshot.data!.current!.tempC}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${snapshot.data!.current!.condition?.text}'),
                            const ImageIcon(
                              color: Colors.white,
                              NetworkImage(
                                  'https://cdn.weatherapi.com/weather/64x64/day/116.png'),
                              size: 40,
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                const Text("error");
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
        ElevatedButton(
            onPressed: () {
              cityController = cityController;
              setState(() {});
            },
            child: const Text('Search'))
      ],
    )));
  }
}
