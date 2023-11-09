import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';

class FavoritCityList extends StatefulWidget {
  const FavoritCityList({super.key});

  @override
  State<FavoritCityList> createState() => _FavoritCityListState();
}

class _FavoritCityListState extends State<FavoritCityList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var element in favoritCity)
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1),
                    blurRadius: 10,
                    spreadRadius: 1)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        element.location!.name!,
                        style: const TextStyle(color: white, fontSize: 30),
                      ),
                      Text(
                        element.location!.localtime!,
                        style: const TextStyle(color: white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${element.current!.tempC?.toInt()}',
                        style: const TextStyle(color: white, fontSize: 50),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          'o',
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
