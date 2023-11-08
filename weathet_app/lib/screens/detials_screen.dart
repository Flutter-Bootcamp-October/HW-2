import 'package:flutter/material.dart';
import 'package:weathet_app/models/weather.dart';
import 'package:weathet_app/widgets/p2_detials.dart';

class DetalsScreen extends StatelessWidget {
  const DetalsScreen({super.key, required this.city});

  final Weather city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Text(
                    city.location!.name ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "26",
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Mostly Clear",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("H:35",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Text("L:26",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ],
              ),
            ),
          ),
          const P2Detials(),
        ],
      ),
    );
  }
}
