import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
              ])),
    );
  }
}
