import 'package:flutter/material.dart';
import 'package:flutter_weather_api/services/api_services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(
            children: [
              TextField(
                controller: cityController,
                onSubmitted: (value) {
                  setState(() {});
                },
              ),
              FutureBuilder(
                  future: getWeatherData(cityController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //print(snapshot.data!.location!.name!);
                      return Column(
                        children: [
                          Text(snapshot.data!.location!.country!),
                          // Text(snapshot.data!.current!.humidity!.toString())
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: Text("Error"));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          )),
        ),
      ),
    );
  }
}
