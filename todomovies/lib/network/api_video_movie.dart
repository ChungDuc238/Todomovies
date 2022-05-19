import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:todomovies/models/video_movie_model.dart';
class ApiVideoMovie {
  Client client = Client();
  Future<VideoMovie> getVideoMovie(String urlVideoMovie) async {
    final response = await client.get(Uri.parse(urlVideoMovie));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data != null) {
      final videoMovie = VideoMovie.fromJson(data);
      return videoMovie;
    }
    throw Exception();
  }
}