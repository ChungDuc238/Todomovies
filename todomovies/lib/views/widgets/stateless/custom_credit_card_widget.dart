import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';

class CustomCreditCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;
  const CustomCreditCard(
      {Key? key, required this.image, this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.45, color: Colors.grey),
          top: BorderSide(width: 0.45, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.only(left: 16.0),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(image!),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Flexible(
                  child: Text(
                    title!,
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                subTitle!,
                style: textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
