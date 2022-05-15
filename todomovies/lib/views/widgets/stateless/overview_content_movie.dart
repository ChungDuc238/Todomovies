import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';

class OverviewContenMovieWidget extends StatelessWidget {
  const OverviewContenMovieWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.45, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Text(
        '${snapshot?.data?.overview}',
        style: textStyle.copyWith(height: 1.4, letterSpacing: 0.7),
      ),
    );
  }
}
