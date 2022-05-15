import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:todomovies/models/movie_now_playing_model.dart';
import 'package:todomovies/network/api_helper.dart';

class HttpService {
  Client client = Client();
  final String? pageUrl = '&page=1';
  Future<MovieNowPlaying> getMovieNowPlaying() async {
    final response = await client.get(Uri.parse(
        "$baseApi/movie/now_playing?api_key=$apiKey"));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data != null) {
      final movieNowPlay = MovieNowPlaying.fromJson(data);
      return movieNowPlay;
    }
    throw Exception();
  }
}
