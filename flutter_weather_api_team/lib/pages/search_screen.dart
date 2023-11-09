import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';
import 'package:flutter_weather_api/pages/country_weather_screen.dart';
import 'package:flutter_weather_api/services/api_services.dart';

import 'package:glass/glass.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = true;

  TextEditingController cityController = TextEditingController(text: "London");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 10, 13, 31),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  maxLines: 1,
                  cursorColor: blue,
                  decoration: InputDecoration(
                      fillColor: white,
                      filled: true,
                      hintText: "Enter City Name",
                      helperStyle: TextStyle(color: blue),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: cityController,
                  onSubmitted: (value) async {
                    try {
                      showDialog(
                          context: context,
                          barrierColor: const Color.fromARGB(44, 255, 255, 255),
                          builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ));
                      final response =
                          await getWeatherData(cityController.text);
                      final responseAstronomy =
                          await getWeatherAstronomy(cityController.text);

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CountryWeatherScreen(
                              weather: response,
                              weatherAstronomy: responseAstronomy,
                            );
                          },
                        ),
                      );
                    } catch (error) {
                      print(error.toString());
                    }
                    setState(() {});
                  },
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: favoritCity.length,
                  itemBuilder: (context, index) {
                    for (var element in favoritCity) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: InkWell(
                            onTap: () async {
                              final response =
                                  await getWeatherData(cityController.text);
                              final responseAstronomy =
                                  await getWeatherAstronomy(
                                      cityController.text);
                              // ignore: use_build_context_synchronously
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CountryWeatherScreen(
                                  weather: response,
                                  weatherAstronomy: responseAstronomy,
                                );
                              }));
                            },
                            child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(1, 1),
                                      blurRadius: 10,
                                      spreadRadius: 1)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          element.location!.name!,
                                          style: const TextStyle(
                                              color: white, fontSize: 30),
                                        ),
                                        Text(
                                          element.location!.localtime!,
                                          style: const TextStyle(color: white),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${element.current!.tempC?.toInt()}',
                                          style: const TextStyle(
                                              color: white, fontSize: 50),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 30),
                                          child: Text(
                                            'o',
                                            style: TextStyle(
                                                color: white, fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ).asGlass(
                                blurX: 3,
                                blurY: 5,
                                tintColor: Color.fromARGB(21, 255, 255, 255),
                                clipBorderRadius: BorderRadius.circular(20)),
                          ));
                    }
                    setState(() {});

                    setState(() {});
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
