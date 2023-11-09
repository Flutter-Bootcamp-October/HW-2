import 'package:flutter/material.dart';

class WeatherClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var firstControlPoint = Offset(size.width / 2.5, 20.0);
    var firstEndPoint = Offset(size.width / 2, 0);
    var secondControlPoint = Offset(size.width - (size.width / 2.5), 50);
    var secondEndPoint = Offset(size.width, 50);
    var path = Path()
      ..lineTo(0, 50)
      ..lineTo(0, 70)
      ..cubicTo(0, 70, 0, 50, 20, 50)
      ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy)
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy)
      ..lineTo(size.width - 20, 50)
      ..cubicTo(size.width - 20, 50, size.width, 50, size.width, 70)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
