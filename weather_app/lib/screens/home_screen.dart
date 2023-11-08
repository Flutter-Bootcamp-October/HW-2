/*
stateful?
init state (display all function to build global weatherList: call api/ Riyadh-London-Jubail)

searchbar: 
 - textfield: "hint enter city name"/ controller
onSubmitted async{
  1. check controller.text not empty
  2. call get weather from api services
  3. check status code
  4. jsonDecode and create weateher object:
    - final decodedResponse = jsonDecode(response.body);
    - Weather.fromJson(decodedResponse);
  5. set golbal current city to Weather object
    - currentCity = Weather.fromJson(decodedResponse);
  6. push to details screen
}

ListView{ uses weatherList}:
 1. widget{ Weather object ---> weatherList[index]}
 2. no tap ->currentCity = weatherList[index];
 3. push to details screen
*/

import 'package:flutter/material.dart';
import 'package:weather_app/consts/decoration.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/global/global.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    buildList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: searchBarDec,
              onSubmitted: (value) async {
                List response =
                    await getWeatherOf(searchController.text ?? "Riyadh");
                if (response[0] == "OK") {
                  currentCity = response[1] as Weather;
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(response[0])));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void buildList() async {
    //weatherList.clear();
    for (String city in defaultList) {
      List response = await getWeatherOf(city);
      if (response[0] == "OK") {
        weatherList.add(response[1]);
      }
    }
  }
}
