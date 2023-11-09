import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/data/global.dart';
import 'package:hw2/extentions/size_extention.dart';
import 'package:hw2/screens/manage_city/components/search_text_field.dart';
import 'package:country_state_city/country_state_city.dart' as cities;
import 'package:hw2/services/weather_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController controller = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = -1;
  List<cities.City>? allCities = [];
  List search = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsSwatch[2],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: SearchTextField(
                  isEnabled: true,
                  controller: controller,
                  onChangedFunc: (value) {
                    final suggestions = allCities!.where(
                      (element) {
                        final cityName = element.name;
                        final input = value.toLowerCase();
                        return cityName.contains(input);
                      },
                    ).toList();
                    setState(() {
                      search = suggestions;
                    });
                  },
                ),
              ),
              FutureBuilder(
                  future: cities.getAllCities(),
                  builder: (context, snapshot) {
                    allCities = snapshot.data;
                    if (snapshot.hasData) {
                      return Wrap(
                        children: [
                          SizedBox(
                            height: context.getHeight(),
                            child: ListView.builder(
                              itemCount: (search.isEmpty)
                                  ? snapshot.data!.length
                                  : search.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  selectedIndex = index;
                                  setState(() {});
                                },
                                child: Chip(
                                  backgroundColor: (selectedIndex == index)
                                      ? colorsSwatch[2]
                                      : colorsSwatch[7],
                                  label: Text((search.isEmpty)
                                      ? snapshot.data![index].name
                                      : "${search[index].name}"),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text("Add"),
        onPressed: () async {
          final add = allCities;
          bool exists = false;

          if (controller.text.isEmpty) {
            await addByChips(context, add, exists);
          } else {
            for (var item in listOfCountries.value) {
              if (item.location!.name!
                  .toLowerCase()
                  .contains(controller.text)) {
                exists = true;
              }
            }
            if (exists) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("City Exists in your list")));
            } else {
              final city = await getCityByName(controller.text);
              if (city.runtimeType == String) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please Enter a valid city name")));
              } else {
                listOfCountries.value.add(city);
              }
            }
            controller.clear();
          }
        },
      ),
    );
  }

  Future<void> addByChips(
      BuildContext context, List<cities.City>? add, bool exists) async {
    if (selectedIndex == -1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select a city")));
    } else {
      for (var item in listOfCountries.value) {
        if (item.location!.name!
            .toLowerCase()
            .contains(add![selectedIndex].name.toLowerCase())) {
          exists = true;
        }
      }
      if (exists) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("City Exists in your list")));
      } else {
        final city = await getCityByName(add![selectedIndex].name);
        listOfCountries.value.add(city);
      }
    }
  }
}
