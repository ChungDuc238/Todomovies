import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:todomovies/models/detail_person_model.dart';
class ApiPersonDetail {
 
  Client client = Client();
  Future<DetailPerson> getPersonDetail(String urlDetailPerson) async {
    final response = await client.get(Uri.parse(urlDetailPerson));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data != null) {
      final personDetail = DetailPerson.fromJson(data);
      return personDetail;
    }
    throw Exception();
  }
}