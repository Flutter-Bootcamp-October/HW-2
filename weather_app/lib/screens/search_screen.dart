import 'package:flutter/material.dart';

import 'package:weather_app/models/glopals.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/services/api/get_weather_data_by_city.dart';
import 'package:weather_app/widgets/weather_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        labelStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)))),
              ),
              FutureBuilder<Weather>(
                future: getWeatherData(searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('');
                  } else if (snapshot.hasData && snapshot.data != null) {
                    final weatherData = snapshot.data!;
                    if (weatherData.location.name
                        .toString()
                        .toLowerCase()
                        .contains(searchText.toLowerCase())) {
                      cityList.add(weatherData);

                      return Column(children: [
                        if (cityList.isNotEmpty)
                          for (var country in cityList)
                            WeatherCard(weatherData: country)
                      ]);
                    }
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
