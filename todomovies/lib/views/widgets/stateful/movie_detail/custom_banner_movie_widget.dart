import 'package:flutter/material.dart';
import 'package:todomovies/common/custom_cliper.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';

class CustomBannerMovie extends StatelessWidget {
  const CustomBannerMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    final yearOfMovie = getYearOfMovie('${snapshot?.data?.releaseDate}');
    var _textDescriptionStyle = const TextStyle(
        color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500);
    return ClipPath(
      clipper: CustomBanerCliper(),
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.only(
          top: 32.0,
          left: 16.0,
        ),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  yearOfMovie,
                  style: _textDescriptionStyle,
                ),
                Text(
                  ' - ',
                  style: _textDescriptionStyle,
                ),
                Text(
                  '${snapshot?.data?.runtime.toString()} min',
                  style: _textDescriptionStyle,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Flexible(
                child: Text(
                  '${snapshot?.data?.originalTitle}'.toUpperCase(),
                  style: _textDescriptionStyle.copyWith(fontSize: 21.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getYearOfMovie(String str) {
    var result = str.split('-');
    return result[0];
  }
}
