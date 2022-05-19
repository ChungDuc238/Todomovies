import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';
import 'package:todomovies/views/widgets/stateless/custom_card_person_widget.dart';

class ListCastPersonWidget extends StatefulWidget {
  const ListCastPersonWidget({Key? key}) : super(key: key);

  @override
  State<ListCastPersonWidget> createState() => _ListCastPersonWidgetState();
}

class _ListCastPersonWidgetState extends State<ListCastPersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Cast',
              style: textStyle.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: _getCastPerson()!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCastPersonPage(
              idPerson: _getCastPerson()?[index].id,
              imageBackground: _getPathProfileCastPerson(index),
            ),
          ),
        );
                },
                child: CustomCarPersonWidget(
                  name: _getCastPerson()?[index].name ??
                      'không thể lấy tên diễn viên',
                  avatarPath: _getPathProfileCastPerson(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // method get url Image Profile of Cast person
  String _getPathProfileCastPerson(int index) {
    if (_getCastPerson()?[index].profilePath == null) {
      return 'https://style.anu.edu.au/_anu/4/images/placeholders/person_6x8.png';
    }

    return '$urlProfile${_getCastPerson()?[index].profilePath}';
  }

  // method get list Cast Person of movie
  List<Cast>? _getCastPerson() {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    final listCast = snapshot?.data?.credits?.cast;
    List<Cast> listCastActing = [];
    if (listCast != null) {
      for (int i = 0; i < listCast.length; i++) {
        if (listCast[i].knownForDepartment?.compareTo('Acting') == 0) {
          listCastActing.add(listCast[i]);
        }
      }
      return listCastActing;
    }
    return null;
  }
}
