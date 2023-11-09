import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';
import 'package:flutter_weather_api/pages/country_weather_screen.dart';
import 'package:flutter_weather_api/services/api_services.dart';
import 'package:flutter_weather_api/widgets/display_add_list.dart';

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
        body: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            color: Color.fromARGB(60, 255, 255, 255),
          ),
          Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    maxLines: 1,
                    cursorColor: blue,
                    decoration: InputDecoration(
                        // fillColor: white,
                        // filled: true,
                        hintText: "Enter City Name",
                        helperStyle: TextStyle(color: blue),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    controller: cityController,
                    onSubmitted: (value) async {
                      try {
                        showDialog(
                            context: context,
                            barrierColor:
                                const Color.fromARGB(44, 255, 255, 255),
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
                  ).asGlass()),

                  DisplayAddList()
            ],
          ),
        ]),
      ),
    );
  }
}
