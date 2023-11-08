import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/models.dart';
import 'package:weather_app/services/api/get_weather_data_by_city.dart';

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Weather'),
      ),
      body: SafeArea(
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
            Stack(
              children: [
                FutureBuilder<Weather>(
                  future: getWeatherData(searchController
                      .text), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData && snapshot.data != null) {
                      final weatherData = snapshot.data!;
                      if (weatherData.location.name
                          .toString()
                          .toLowerCase()
                          .contains(searchText.toLowerCase())) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  getWeatherImage(
                                      weatherData.current.condition.code),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${weatherData.current.feelslikeC}°C',
                                              style: const TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 4),
                                            // Text(
                                            //   'Low: ${weatherData.current.condition.text}°C',
                                            //   style:
                                            //       const TextStyle(fontSize: 16),
                                            // ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  weatherData.location.region,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                // const SizedBox(width: 200),
                                                // Text(
                                                //   weatherData
                                                //       .current.condition.text,
                                                //   style: const TextStyle(
                                                //       fontSize: 16,
                                                //       color: Colors.white),
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                    return const SizedBox();
                  },
                ),
                Positioned(
                  right: 30,
                  top: 5,
                  child: Image.asset(
                    'lib/assets/snow.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
