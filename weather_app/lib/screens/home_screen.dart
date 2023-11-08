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
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(0, 255, 252, 252),
        elevation: 1,
        title: Column(
          children: [
            const Align(alignment: Alignment.centerLeft, child: title),
            const SizedBox(height: 5),
            TextField(
              controller: searchController,
              decoration: searchBarDec,
              onSubmitted: (value) async {
                if (searchController.text.isNotEmpty) {
                  setState(() {
                    isLoading = true;
                  });
                  List response = await getWeatherOf(searchController.text);
                  setState(() {
                    isLoading = false;
                  });

                  if (response[0] == "OK") {
                    currentCity = response[1] as Weather;
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(response[0])));
                  }
                }
              },
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : FutureBuilder(
              future: buildList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: weatherList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HomeWidget(city: weatherList[index]);
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
    );
  }

  Future buildList() async {
    weatherList.clear();
    for (var city in cityList) {
      List response = await getWeatherOf(city);
      if (response[0] == "OK") {
        weatherList.add(response[1] as Weather);
      }
    }
    return "filled";
  }
}
