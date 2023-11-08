import 'package:flutter/material.dart';

class WeatherDetailsContainer extends StatelessWidget {
  WeatherDetailsContainer({
    super.key,
    required this.textEntry1,
    required this.image,
    required this.textEntry2,
    required this.textEntry3,
    this.textEntry4,
  });

  final String textEntry1;
  final String image;
  final String textEntry2;
  final String textEntry3;
  String? textEntry4;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Colors.white.withOpacity(0.3)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$textEntry1",
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  image,
                  height: 30,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.white,
            ),
            Text(
              textEntry2,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              textEntry3,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "${textEntry4}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
