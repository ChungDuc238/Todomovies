import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/views/widgets/stateless/custom_star_rating_widget.dart';

class MyRatingWidget extends StatefulWidget {
  const MyRatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyRatingWidget> createState() => _MyRatingWidgetState();
}

class _MyRatingWidgetState extends State<MyRatingWidget> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'My Rating',
            style: textStyle.copyWith(fontSize: 18.0),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Rate this movie',
            style: textStyle.copyWith(fontSize: 24.0),
          ),
          const SizedBox(
            height: 16.0,
          ),
          StarRating(
            rating: rating,
            onRatingChanged: (rating) => setState(() {
              this.rating = rating;
            }),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
