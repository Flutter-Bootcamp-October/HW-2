import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/data/global.dart';
import 'package:hw2/extentions/size_extention.dart';
import 'package:hw2/main.dart';
import 'package:hw2/screens/manage_city/search_screen.dart';

import '../../services/weather_api.dart';
import 'components/search_text_field.dart';

class ManageCityScreen extends StatefulWidget {
  const ManageCityScreen({Key? key}) : super(key: key);

  @override
  State<ManageCityScreen> createState() => _ManageCityScreenState();
}

TextEditingController controller = TextEditingController();

class _ManageCityScreenState extends State<ManageCityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsSwatch[1],
      appBar: AppBar(
        backgroundColor: colorsSwatch[5],
        elevation: 2,
        title: const Text("Manage cities"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()))
                    .then((value) {
                  setState(() {});
                });
              },
              child: SearchTextField(
                isEnabled: false,
                controller: controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfCountries.value.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final country = listOfCountries.value[index];
                  return Dismissible(
                    background: Container(
                      padding: const EdgeInsets.only(right: 16),
                      alignment: Alignment.centerRight,
                      color: colorsSwatch[2],
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      listOfCountries.value.remove(country);
                    },
                    child: InkWell(
                      onTap: () {
                        defaultCountry = listOfCountries.value[index];
                        didChange.value = !didChange.value;
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 110,
                        child: Card(
                          color: colorsSwatch[2],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${country.location!.name}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        "${country.current!.condition!.text}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(height: 12),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${country.current!.tempC}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Humidity: ${country.current!.humidity}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
