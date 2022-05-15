import 'package:flutter/material.dart';

class ClickMovieWidget extends StatelessWidget {
  const ClickMovieWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _iconColor = Colors.white;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.45),
        ),
      ),
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.play_circle_outline,
            color: _iconColor,
            size: 48.0,
          ),
          Icon(
            Icons.add,
            color: _iconColor,
            size: 48.0,
          ),
          Icon(
            Icons.ios_share_rounded,
            color: _iconColor,
            size: 48.0,
          ),
        ],
      ),
    );
  }
}
