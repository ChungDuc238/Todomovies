import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_now_playing_model.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/network/http_service.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';

class InThreaterPage extends StatefulWidget {
  const InThreaterPage({Key? key}) : super(key: key);

  @override
  State<InThreaterPage> createState() => _InThreaterPageState();
}

class _InThreaterPageState extends State<InThreaterPage> {
  late HttpService apiService;
  late Future<MovieNowPlaying> moviePlaying;

  // late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    apiService = HttpService();
    moviePlaying = apiService.getMovieNowPlaying();

    // _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<MovieNowPlaying>(
          future: moviePlaying,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                color: Colors.black,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.results?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.7),
                    itemBuilder: (context, int index) {
                      print('id: ${snapshot.data?.results?[index].posterPath}');
                      return InkWell(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                  idMovie: snapshot.data?.results?[index].id),
                            ),
                          );
                        }),
                        child: Image.network(
                            '$urlImage${snapshot.data?.results?[index].posterPath}'),
                      );
                    }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
