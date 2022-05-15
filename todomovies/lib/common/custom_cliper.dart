import 'package:flutter/material.dart';

class CustomBanerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 50);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
