import 'package:flutter/material.dart';
import 'package:todomovies/models/image_movie_model.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/network/api_overview_image_movie.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';
import 'package:todomovies/views/pages/trailer_movie_page/trailer_movie_page.dart';

class OverviewImageMovieWidget extends StatefulWidget {
  const OverviewImageMovieWidget({Key? key}) : super(key: key);

  @override
  State<OverviewImageMovieWidget> createState() =>
      _OverviewImageMovieWidgetState();
}

class _OverviewImageMovieWidgetState extends State<OverviewImageMovieWidget> {
  late ApiOverviewImageMovie _apiOverviewImageMovie;
  late Future<ImageMovie> imageMovie;

  @override
  void initState() {
    super.initState();
    _apiOverviewImageMovie = ApiOverviewImageMovie();
  }

  @override
  Widget build(BuildContext context) {
    final id = InheritedDataMovieDetail.of(context)?.id;
    imageMovie = _apiOverviewImageMovie
        .getOverviewImageMovie('$baseApi/movie/$id/images?api_key=$apiKey');
    // ignore: unused_local_variable
    int? _totalImage = 0;
    return SizedBox(
      height: 150,
      child: FutureBuilder<ImageMovie>(
        future: imageMovie,
        builder: (context, snapshot) {
          // giới hạn tổng số image overview được hiện
          if (snapshot.data?.backdrops?.length != null) {
            _totalImage = snapshot.data?.posters?.length;
            if (_totalImage! > 10) {
              _totalImage = 5;
            }
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _totalImage,
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrailerMoviePage(id: id!),
                    )),
                child: Image.network(
                  '$urlImageOverview${snapshot.data?.backdrops?[index].filePath}',
                  // width: 200,
                  fit: BoxFit.fill,
                ),
              ),
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
    );
  }
}
