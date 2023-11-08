import 'package:flutter/material.dart';

class P2Detials extends StatelessWidget {
  const P2Detials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text("85%", style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text("HUMIDILTY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          Column(
            children: [
              Text("7", style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text("FEELS LIKE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600))
            ],
          ),
          Column(
            children: [
              Text("7 km/h",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text("WIND",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600))
            ],
          ),
        ],
      ),
    );
  }
}
