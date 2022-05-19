import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todomovies/models/video_movie_model.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/network/api_video_movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerMoviePage extends StatefulWidget {
  final int id;
  const TrailerMoviePage({Key? key, required this.id}) : super(key: key);

  @override
  State<TrailerMoviePage> createState() => _TrailerMoviePageState();
}

class _TrailerMoviePageState extends State<TrailerMoviePage> {
  ApiVideoMovie apiService = ApiVideoMovie();
  late Future<VideoMovie> videoMovie;
  late VideoMovie _videoMovies;
  late YoutubePlayerController _controller;
  String key = '';
  @override
  void initState() {
    super.initState();
    _videoMovies = VideoMovie();
    videoMovie = _initVideoMovies();

    getVideo();
    // key = _videoMovies.results?[13].key;

    log(key.toString());
    _controller = YoutubePlayerController(
        initialVideoId: key,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (_getListKeyMovie() == null) {
    //   log('lỗi');
    // }
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<VideoMovie>(
          future: videoMovie,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return YoutubePlayerBuilder(
                player: YoutubePlayer(controller: _controller),
                builder: (context, player) => ListView(
                  children: [
                    player,
                  ],
                ),
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

  Future<VideoMovie> _initVideoMovies() async {
    final video = await apiService
        .getVideoMovie('$baseApi/movie/${widget.id}/videos?api_key=$apiKey');

    return video;
  }

  void getVideo() async {
    _videoMovies = await _initVideoMovies();
    int? lenght = _videoMovies.results?.length;
    if (lenght != null) {
      for (int i = 0; i < lenght; i++) {
        if (_videoMovies.results?[i].type?.compareTo('Trailer') == 0) {
          key = _videoMovies.results?[i].key ?? '';
        }
      }
    }
  }

  // String? _getListKeyMovie() {
  //   int? lenght = _videoMovies.results?.length;
  //   if (lenght != null) {
  //     for (int i = 0; i < lenght; i++) {
  //       if (_videoMovies.results?[i].name?.compareTo('Final Trailer') == 0) {
  //         return _videoMovies.results?[i].key;
  //       }
  //     }
  //   }

  //   return null;
  // }

}
