import 'package:flutter/material.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';
import 'package:todomovies/views/pages/trailer_movie_page/trailer_movie_page.dart';

class ClickMovieWidget extends StatelessWidget {
  const ClickMovieWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _iconColor = Colors.white;
    final id = InheritedDataMovieDetail.of(context)?.id;
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
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrailerMoviePage(id: id!),
              ),
            ),
            child: Icon(
              Icons.play_circle_outline,
              color: _iconColor,
              size: 48.0,
            ),
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
