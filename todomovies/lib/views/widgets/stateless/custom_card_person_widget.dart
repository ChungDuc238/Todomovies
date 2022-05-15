import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/views/widgets/stateless/custom_avatar_widget.dart';

class CustomCarPersonWidget extends StatefulWidget {
  final String? avatarPath;
  final String name;
  const CustomCarPersonWidget(
      {Key? key, required this.name, required this.avatarPath})
      : super(
          key: key,
        );

  @override
  State<CustomCarPersonWidget> createState() => _CustomCarPersonWidgetState();
}

class _CustomCarPersonWidgetState extends State<CustomCarPersonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.45, color: Colors.grey),
          top: BorderSide(width: 0.45, color: Colors.grey),
        ),
      ),
      child: Container(
        color: const Color(0xFF2a2a2a),
        child: Row(
          children: [
            const SizedBox(
              width: 16.0,
            ),
            CustomAvatarCircle(imagePath: widget.avatarPath ?? ''),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              widget.name,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
