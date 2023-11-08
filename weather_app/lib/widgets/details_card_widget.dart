/*
attributes:
  - bool day???
  - icon rowIcon
  - String rowString
  - Widget body: 




Container( color : day ? light blue : dark light
 child: column (row [ rowIcon , rowString], body)

*/

import 'package:flutter/material.dart';
import 'package:weather_app/global/global.dart';
import 'package:weather_app/widgets/details_card_title_widget.dart';

class DetailCard extends StatelessWidget {
  const DetailCard(
      {super.key,
      required this.cardtitle,
      required this.cardImage,
      required this.cardValue});

  final String cardtitle;
  final String cardImage;
  final String cardValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentCity.current!.isDay! == 0
            ? Color(0xff001026).withOpacity(0.2)
            : Color(0xff104084).withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: DetailCardTitle(
              cardTitle: cardtitle,
              cardImage: cardImage, 
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 20),
                child: Text(cardValue,
                    style: TextStyle(color: Colors.white, fontSize: 32)),
              )
            ],
          )
        ],
      ),
    );
  }
}
