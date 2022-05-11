import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_now_playing_model.dart';
import 'package:todomovies/network/http_service.dart';

class InThreaterPage extends StatefulWidget {
  const InThreaterPage({Key? key}) : super(key: key);

  @override
  State<InThreaterPage> createState() => _InThreaterPageState();
}

class _InThreaterPageState extends State<InThreaterPage> {
  late HttpService apiService;
  late Future<MovieNowPlaying> moviePlaying;
  late String urlImage;
  @override
  void initState() {
    super.initState();
    apiService = HttpService();
    moviePlaying = apiService.getMovieNowPlaying();
    urlImage = 'https://image.tmdb.org/t/p/w500';
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
                      return Image.network(
                          '$urlImage${snapshot.data?.results?[index].posterPath}');
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
