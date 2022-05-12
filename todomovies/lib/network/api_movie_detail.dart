import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:todomovies/models/movie_detail_model.dart';


class ApiMovieDetail {
 
  Client client = Client();
  Future<MovieDetail> getMovieDetail(String urlImageDetail) async {
    final response = await client.get(Uri.parse(urlImageDetail));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data != null) {
      final movieDetail = MovieDetail.fromJson(data);
      return movieDetail;
    }
    throw Exception();
  }
}
