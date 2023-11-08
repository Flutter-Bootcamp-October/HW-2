import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  WeatherDetails(
      {super.key,
      required this.icon,
      required this.text,
      required this.info,
      this.unit});
  String icon;
  String text;
  String info;
  String? unit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      // color: Colors.amber,
      child: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(
            icon,
            width: 40,
            height: 40,
            color: Color(0xffd1d1d0),
            // color: Color(0xffd1d1d0),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: info,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: unit,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
