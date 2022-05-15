import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';

class ItemListview extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;
  const ItemListview(
      {Key? key, required this.title, required this.content, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.45, color: Colors.grey),
          top: BorderSide(width: 0.45, color: Colors.grey),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: const Color(0xFF2a2a2a),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  child: Flexible(
                    child: Text(
                      content,
                      style: textStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
