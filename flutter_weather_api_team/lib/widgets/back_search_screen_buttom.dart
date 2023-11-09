import 'package:flutter/material.dart';
import 'package:flutter_weather_api/pages/search_screen.dart';

class BackToSearchScreenButtom extends StatelessWidget {
  const BackToSearchScreenButtom({super.key, required this.themeColor});
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SearchScreen();
        }));
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 40,
        color: themeColor,
      ),
    );
  }
}
