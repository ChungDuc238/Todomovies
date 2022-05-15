import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/network/api_movie_detail.dart';
import 'package:todomovies/views/widgets/stateful/movie_detail/movie_detail_widget.dart';

class MovieDetailPage extends StatefulWidget {
  final int? idMovie;
  const MovieDetailPage({Key? key, this.idMovie}) : super(key: key);

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
    movieDetail = _apiMovieDetail.getMovieDetail(
        '$baseApi/movie/${widget.idMovie}?api_key=$apiKey&append_to_response=credits');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<MovieDetail>(
          future: movieDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return InheritedDataMovieDetail(
                id: widget.idMovie,
                snapshot: snapshot,
                child: MovieDetailWidget(snapshot: snapshot),
              );
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
      ),
    );
  }
}

class InheritedDataMovieDetail extends InheritedWidget {
  final AsyncSnapshot<MovieDetail>? snapshot;
  final int? id;
  // ignore: use_key_in_widget_constructors
  const InheritedDataMovieDetail(
      {required Widget child, this.snapshot, this.id})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static InheritedDataMovieDetail? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedDataMovieDetail>();
  }
}
