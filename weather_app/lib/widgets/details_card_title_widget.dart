import 'package:flutter/material.dart';

class DetailCardTitle extends StatelessWidget {
  const DetailCardTitle(
      {super.key, required this.cardImage, required this.cardTitle});

  final String cardImage;
  final String cardTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          cardImage,
          color: Color(0xff63647e),
          width: 20,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 4),
          child: Text(
            cardTitle,
            style: const TextStyle(fontSize: 14, color: Color(0xff63647e)),
          ),
        ),
      ],
    );
  }
}
