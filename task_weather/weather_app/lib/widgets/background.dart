import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1e264a),
              Color(0xff3b3781),
              Color(0xff6449aa),
              Color(0xff7f50ae),
              Color(0xff9047ac),
            ],
          ),
        ),
        child: child);
  }
}
