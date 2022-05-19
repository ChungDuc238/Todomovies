import 'package:flutter/material.dart';
import 'package:todomovies/models/detail_person_model.dart';
import 'package:todomovies/network/api_detail_cast_person.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/views/widgets/stateful/detail_person/detail_cast_person_widget.dart';

class DetailCastPersonPage extends StatefulWidget {
  final int? idPerson;
  final String? imageBackground;
  const DetailCastPersonPage(
      {Key? key, required this.idPerson, this.imageBackground})
      : super(key: key);

  @override
  State<DetailCastPersonPage> createState() => _DetailCastPersonPageState();
}

class _DetailCastPersonPageState extends State<DetailCastPersonPage> {
  late ApiPersonDetail _apiPersonDetail;
  late Future<DetailPerson> personDetail;
  @override
  void initState() {
    super.initState();
    _apiPersonDetail = ApiPersonDetail();
    personDetail = _apiPersonDetail
        .getPersonDetail('$baseApi/person/${widget.idPerson}?api_key=$apiKey');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<DetailPerson>(
          future: personDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // print(snapshot.data!.id!);
              return InheritedDataDetailCasPerson(
                snapshot: snapshot,
                imageBackground: widget.imageBackground,
                id: snapshot.data!.id!,
                child: const DetailCasPersonWidget(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else {
              return const Text('error');
            }
          },
        ),
      ),
    );
  }
}

class InheritedDataDetailCasPerson extends InheritedWidget {
  final AsyncSnapshot<DetailPerson>? snapshot;
  final String? imageBackground;
  final int id;
  // ignore: use_key_in_widget_constructors
  const InheritedDataDetailCasPerson(
      {required Widget child,
      this.snapshot,
      this.imageBackground,
      required this.id})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static InheritedDataDetailCasPerson? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedDataDetailCasPerson>();
  }
}
