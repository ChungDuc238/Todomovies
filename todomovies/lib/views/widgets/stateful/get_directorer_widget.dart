import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';
import 'package:todomovies/views/widgets/stateless/custom_card_person_widget.dart';

class DirectorWidget extends StatefulWidget {
  const DirectorWidget({Key? key}) : super(key: key);

  @override
  State<DirectorWidget> createState() => _DirectorWidgetState();
}

class _DirectorWidgetState extends State<DirectorWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCastPersonPage(
              idPerson: getDirector()?.id,
              imageBackground: getPathProfileDirrector(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Director',
                style: textStyle.copyWith(color: Colors.grey),
              ),
            ),
            CustomCarPersonWidget(
              name: getDirector()?.name ?? '',
              avatarPath: getPathProfileDirrector(),
            ),
          ],
        ),
      ),
    );
  }

  //method get information director
  Crew? getDirector() {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    final listCrew = snapshot?.data?.credits?.crew;
    if (listCrew != null) {
      for (int i = 0; i < listCrew.length; i++) {
        if (listCrew[i].department?.compareTo('Directing') == 0 &&
            listCrew[i].job?.compareTo('Director') == 0) {
          return listCrew[i];
        }
      }
    }
    return null;
  }

  // method get url Image Profile of Director
  String getPathProfileDirrector() {
    if (getDirector()?.profilePath == null) {
      return 'https://pdp.edu.vn/wp-content/uploads/2021/05/hinh-nen-mau-xam.jpg';
    } else {
      return '$urlImagePoster${getDirector()?.profilePath}';
    }
  }
}
