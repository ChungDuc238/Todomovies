import 'package:flutter/material.dart';

class CustomAvatarCircle extends StatelessWidget {
  final String imagePath;

  const CustomAvatarCircle({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(30), // Image radius
        child: Image(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
