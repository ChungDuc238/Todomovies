import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundImageProflie extends StatelessWidget {
  const BackgroundImageProflie({
    Key? key,
    required this.imageBackgroundPath,
  }) : super(key: key);

  final String? imageBackgroundPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ClipRRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 20),
          child: Image.network(
            imageBackgroundPath ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}