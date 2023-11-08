import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30, right: 250, bottom: 10),
      child: Text(
        "Weather",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
