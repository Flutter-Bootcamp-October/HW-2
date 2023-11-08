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
import 'package:weather_app/consts/text.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/global/global.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:weather_app/widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
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
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(0, 255, 252, 252),
        elevation: 2,
        title: Column(
          children: [
            const Align(alignment: Alignment.centerLeft, child: title),
            const SizedBox(height: 5),
            TextField(
              controller: searchController,
              decoration: searchBarDec,
              onSubmitted: (value) async {
                setState(() {
                  isLoading = true;
                });
                List response =
                    await getWeatherOf(searchController.text ?? "Riyadh");
                setState(() {
                  isLoading = false;
                });

                if (response[0] == "OK") {
                  print("nice");
                  currentCity = response[1] as Weather;
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(response[0])));
                }
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: weatherList.length,
            itemBuilder: (BuildContext context, int index) {
              return HomeWidget(city: weatherList[0]);
            }),
      ),
    );
  }

  void buildList() {
    for (var city in defaultList) {
      weatherList.add(Weather.fromJson(city));
    }
  }
}
