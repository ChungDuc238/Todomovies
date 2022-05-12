import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/network/api_movie_detail.dart';

class MovieDetailPage extends StatefulWidget {
  final int? idMovie;
  const MovieDetailPage({Key? key, required this.idMovie}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late ApiMovieDetail _apiMovieDetail;
  late Future<MovieDetail> movieDetail;
  @override
  void initState() {
    super.initState();
    _apiMovieDetail = ApiMovieDetail();
    movieDetail = _apiMovieDetail
        .getMovieDetail('$baseApi/${widget.idMovie}?api_key=$apiKey');


  }

  @override
  Widget build(BuildContext context) {
    // print('$idMovie');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        title: Text("loi"),
        backgroundColor: Colors.grey.withAlpha(200),
        elevation: 0,
      ),
      body: FutureBuilder<MovieDetail>(
        future: movieDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.network('$urlImagePoster${snapshot.data?.posterPath}');
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
