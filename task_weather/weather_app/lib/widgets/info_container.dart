import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.icon, required this.value});
  final IconData icon;
  final num value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff423192),
            Color(0xff423192),
            Color(0xff8570c2),
          ],
        ),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Icon(icon, color: Colors.white),
        Text("$value", style: const TextStyle(color: Colors.white))
      ]),
    );
  }
}
