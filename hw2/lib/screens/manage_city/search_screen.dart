import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/data/global.dart';
import 'package:hw2/extentions/size_extention.dart';
import 'package:hw2/main.dart';
import 'package:hw2/screens/manage_city/components/search_text_field.dart';
// import country_state_city package
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
                  onChangedFunc: (value) {},
                ),
              ),
              FutureBuilder(
                  future: cities.getAllCities(),
                  builder: (context, snapshot) {
                    allCities = snapshot.data;
                    if (snapshot.hasData) {
                      return Wrap(
                        children: [
                          ...List.generate(
                              20,
                              (index) => InkWell(
                                  onTap: () {
                                    selectedIndex = index;
                                    setState(() {});
                                  },
                                  child: Chip(
                                      backgroundColor: (selectedIndex == index)
                                          ? colorsSwatch[2]
                                          : colorsSwatch[7],
                                      label: Text(snapshot.data![index].name))))
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

          if (selectedIndex == -1) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select a city")));
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
        },
      ),
    );
  }
}
