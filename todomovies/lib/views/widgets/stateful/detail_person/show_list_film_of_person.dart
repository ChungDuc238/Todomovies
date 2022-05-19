
import 'package:flutter/material.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';
import 'package:todomovies/views/widgets/stateless/custom_credit_card_widget.dart';

class ShowListFilmOfCastPerson extends StatelessWidget {
  final List listCredit;
  const ShowListFilmOfCastPerson({Key? key, required this.listCredit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: listCredit.length,
      itemBuilder: ((context, index) {
        String? imagePath = listCredit[index].posterPath;
        // log(listCredit[index].id);
        if (imagePath != null) {
          imagePath = '$urlImage${listCredit[index].posterPath}';
        } else {
          imagePath =
              'https://style.anu.edu.au/_anu/4/images/placeholders/person_6x8.png';
        }
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailPage(idMovie: listCredit[index].id),
                ));
          },
          child: CustomCreditCard(
            image: imagePath,
            title: '${listCredit[index].originalTitle}',
            subTitle: '${listCredit[index].releaseDate}',
          ),
        );
      }),
    );
  }
}
