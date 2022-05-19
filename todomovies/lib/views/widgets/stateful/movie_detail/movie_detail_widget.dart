import 'package:flutter/material.dart';
import 'package:todomovies/views/widgets/stateful/movie_detail/body_movie_detail_widget.dart';
import 'package:todomovies/views/widgets/stateless/app_bar_widget.dart';

class MovieDetailWidget extends StatefulWidget {
  const MovieDetailWidget({Key? key,}) : super(key: key);

  @override
  State<MovieDetailWidget> createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.black, child: const BodyMovieDetailWidget(),),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppbarMovieDetailWidget(),
        ),
      ],
    );
  }
}
