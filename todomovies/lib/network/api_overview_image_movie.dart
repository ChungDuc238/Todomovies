import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:todomovies/models/image_movie_model.dart';
class ApiOverviewImageMovie {
  Client client = Client();
  Future<ImageMovie> getOverviewImageMovie(String urlImageMovie) async {
    final response = await client.get(Uri.parse(urlImageMovie));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data != null) {
      final imageMovie = ImageMovie.fromJson(data);
      return imageMovie;
    }
    throw Exception();
  }
}
