import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
    required this.heightLine,
    required this.widthLine,
    required this.colorLine,
  });

  final double heightLine;
  final double widthLine;
  final Color colorLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightLine,
      width: widthLine,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: colorLine),
    );
  }
}
