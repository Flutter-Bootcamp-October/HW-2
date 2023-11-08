import 'package:flutter/material.dart';
import 'package:weathet_app/global/global.dart';
import 'package:weathet_app/models/weather.dart';
import 'package:weathet_app/screens/home_screen.dart';
import 'package:weathet_app/services/weather_api.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    Weather? city;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(63, 158, 158, 158)),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: cityController,
                decoration: InputDecoration(
                    hintText: "Search for a city or airport",
                    focusedBorder: InputBorder.none,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
                    prefixIcon: InkWell(
                      onTap: () async {
                        try {
                          isLoading = true;

                          context
                              .findAncestorStateOfType<HomeScreenState>()!
                              .setState(() {});
                          city = await getCityData(cityController.text);
                          if (city != null) {
                            citiesList.add(city!);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("The city is found")));
                            isLoading = false;
                            context
                                .findAncestorStateOfType<HomeScreenState>()!
                                .setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("The city not found")));
                          }
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("The ID must be digit only")));
                        }
                      },
                      child: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 158, 158, 158),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
