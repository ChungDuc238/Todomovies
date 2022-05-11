import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:todomovies/models/movie_now_playing_model.dart';

class HttpService {
  final String baseUrl = 'https://api.themoviedb.org/3';
  Client client = Client();
  final String? pageUrl = '&page=4';
  Future<MovieNowPlaying> getMovieNowPlaying() async {
    final response = await client.get(Uri.parse(
        "$baseUrl/movie/now_playing?api_key=d79d9f8467a0e6d7b24624c522cb2ab3$pageUrl"));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data != null) {
      final movieNowPlay = MovieNowPlaying.fromJson(data);
      return movieNowPlay;
    }
    throw Exception();
  }
}
