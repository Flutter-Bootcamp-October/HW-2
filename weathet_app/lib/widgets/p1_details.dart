import 'package:flutter/material.dart';

class P1Detials extends StatelessWidget {
  const P1Detials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Text(
              "London",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "26",
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Mostly Clear",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("H:35",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(
                  width: 10,
                ),
                Text("L:26",
                    style: TextStyle(color: Colors.white, fontSize: 20))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
