import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isWeek = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: isWeek ? Colors.white : colorsSwatch[2],
        ),
        Column(
          children: [
            Switch(
                value: isWeek,
                thumbColor: MaterialStatePropertyAll<Color>(colorsSwatch[2]),
                activeColor: colorsSwatch[4],
                inactiveTrackColor: colorsSwatch[4],
                onChanged: (value) {
                  isWeek = !isWeek;
                  setState(() {});
                }),
            const Text("Week/Day"),
          ],
        ),
        CircleAvatar(
          radius: 4,
          backgroundColor: isWeek ? colorsSwatch[2] : Colors.white,
        ),
      ],
    );
  }
}
