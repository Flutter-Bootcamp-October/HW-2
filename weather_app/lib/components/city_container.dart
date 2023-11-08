import 'package:flutter/material.dart';

class CityContainer extends StatelessWidget {
  const CityContainer({
    super.key,
    required this.condetion,
    required this.cityName,
    required this.weatherCondetion,
    required this.temp,
    required this.iconURL,
  });
  final bool condetion;
  final String cityName;
  final String weatherCondetion;
  final String temp;
  final String iconURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: condetion
              ? Colors.grey.shade100.withOpacity(0.1)
              : Colors.blue.withOpacity(0.5)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              cityName,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            Text(
              weatherCondetion,
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
          ],
        ),
        Text(
          '${temp}',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Image.network(fit: BoxFit.fitHeight, iconURL)
      ]),
    );
  }
}
