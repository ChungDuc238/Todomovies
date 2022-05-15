import 'package:flutter/material.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';
import 'package:todomovies/views/widgets/stateless/custom_item_listview_widget.dart';

class ProductionWidget extends StatefulWidget {
  const ProductionWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductionWidget> createState() => _ProductionWidgetState();
}

class _ProductionWidgetState extends State<ProductionWidget> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      width: double.infinity,
      child: Column(
        children: [
          const ItemListview(
            title: 'Custom Lists',
            content: 'None',
            icon: Icons.arrow_forward_ios_rounded,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ItemListview(
            title: 'Release Date',
            content: '${snapshot?.data?.releaseDate}',
          ),
          ItemListview(
            title: 'Runtime',
            content: '${snapshot?.data?.runtime.toString()} min',
          ),
          const ItemListview(
            title: 'Rating',
            content: 'Not Available',
          ),
          ItemListview(
            title: 'Genre',
            content: _getListGenre()?.join(',') ?? '',
          ),
        ],
      ),
    );
  }

  // method get genres of movie
  List<String>? _getListGenre() {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    final genre = snapshot?.data?.genres;
    List<String> listGenre = [];
    if (genre != null) {
      for (int i = 0; i < genre.length; i++) {
        listGenre.add(genre[i].name ?? '');
      }
      return listGenre;
    }
    return null;
  }
}
