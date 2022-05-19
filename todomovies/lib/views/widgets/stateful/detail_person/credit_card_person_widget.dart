import 'package:flutter/material.dart';
import 'package:todomovies/models/credit_person_model.dart';
import 'package:todomovies/network/api_credit_person.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';
import 'package:todomovies/views/widgets/stateful/detail_person/show_list_film_of_person.dart';

class CreditCardPerson extends StatefulWidget {
  const CreditCardPerson({Key? key}) : super(key: key);

  @override
  State<CreditCardPerson> createState() => _CreditCardPersonState();
}

class _CreditCardPersonState extends State<CreditCardPerson> {
  late ApiCreditPerson apiCreditPerson;
  late Future<CreditPerson> creditCardPerson;
  late int? idPerson;
  @override
  void initState() {
    super.initState();
    apiCreditPerson = ApiCreditPerson();
  }

  @override
  Widget build(BuildContext context) {
    idPerson = InheritedDataDetailCasPerson.of(context)?.id;
    creditCardPerson = apiCreditPerson.getCreditPerson(
        '$baseApi/person/${idPerson.toString()}/movie_credits?api_key=$apiKey');
    return FutureBuilder<CreditPerson>(
        future: creditCardPerson,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Cast>? listCast = snapshot.data?.cast;
            List<Cast>? listCrew = snapshot.data?.crew;
            if (listCast!.isEmpty && listCrew!.isEmpty) {
              return const Text('Not Alivable');
            } else if (listCast.isEmpty) {
              // if List Cast Empty => Listview Film in ListCrew
              return ShowListFilmOfCastPerson(listCredit: listCrew!);
            } else if (listCrew!.isEmpty) {
              // if List Cast Empty => Listview Film in ListCast
              return ShowListFilmOfCastPerson(listCredit: listCast);
            } else {
              for (int i = 0; i < listCrew.length; i++) {
                for (int j = 1; j < listCast.length; j++) {
                  // ignore: unrelated_type_equality_checks
                  if (listCrew[i].id == listCast[j].id) {
                    listCast.remove(listCast[j]);
                  }
                }
              }

              return ShowListFilmOfCastPerson(listCredit: listCast + listCrew);
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else {
            return const Text('error');
          }
        });
  }
}
