import 'package:flutter/material.dart';
import 'package:weather_app/global/global.dart';

class DetailCardTitle extends StatelessWidget {
  const DetailCardTitle(
      {super.key, required this.cardIcon, required this.cardTitle});

  final IconData cardIcon;
  final String cardTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          cardIcon,
          color: currentCity.current!.isDay! == 0
              ? Color(0xff63647e)
              : Colors.white,
          size: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 4),
          child: Text(
            cardTitle,
            style: TextStyle(
              fontSize: 14,
              color: currentCity.current!.isDay! == 0
                  ? Color(0xff63647e)
                  : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
