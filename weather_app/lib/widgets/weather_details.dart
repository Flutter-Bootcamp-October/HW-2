import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeatherDetails extends StatelessWidget {
  WeatherDetails(
      {super.key,
      required this.icon,
      required this.text,
      required this.info,
      required this.color,
      this.unit});
  String icon;
  String text;
  String info;
  String? unit;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(
            icon,
            width: 40,
            height: 40,
            color: color,
            // color: Color(0xffd1d1d0),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
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
