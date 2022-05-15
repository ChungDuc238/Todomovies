import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';

class AppbarMovieDetailWidget extends StatelessWidget {
  const AppbarMovieDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 30),
          child: Container(
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                //  const Icon(Icons.arrow_back),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/images/icon_back_tabview.png')),
                const SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  child: Text(
                    '${snapshot?.data?.originalTitle}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
