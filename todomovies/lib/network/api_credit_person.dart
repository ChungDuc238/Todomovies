import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:todomovies/models/credit_person_model.dart';
class ApiCreditPerson {
 
  Client client = Client();
  Future<CreditPerson> getCreditPerson(String urlCreditPerson) async {
    final response = await client.get(Uri.parse(urlCreditPerson));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data != null) {
      final creditPerson = CreditPerson.fromJson(data);
      return creditPerson;
    }
    throw Exception();
  }
}