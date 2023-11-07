import 'package:flutter/material.dart';
import 'package:weather_app/services/api_server.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({
    super.key,
  });

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  TextEditingController cityController = TextEditingController(text: 'London');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff141441),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              TextField(
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100.withOpacity(0.1),
                  filled: true,
                  hintText: 'London',
                  suffix: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      cityController;
                      setState(() {});
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                ),
                controller: cityController,
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                  future: getWeatherData(cityController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: snapshot.data!.current!.isDay == 0
                                ? Colors.grey.shade100.withOpacity(0.1)
                                : Colors.blue.withOpacity(0.5)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${snapshot.data!.location!.country}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '${snapshot.data!.current!.condition?.text}',
                                    style:
                                        const TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                              Text(
                                '${snapshot.data!.current!.isDay}',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                  fit: BoxFit.fitHeight,
                                  'https:${snapshot.data!.current!.condition?.icon}')
                            ]),
                      );
                    } else if (snapshot.hasError) {
                      const Text("error");
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        )));
  }
}
