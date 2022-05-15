import 'package:flutter/material.dart';
import 'package:todomovies/views/widgets/stateful/get_directorer_widget.dart';
import 'package:todomovies/views/widgets/stateful/list_cast_person_widget.dart';

class ShowListCastMovieWidget extends StatefulWidget {
  const ShowListCastMovieWidget({Key? key}) : super(key: key);

  @override
  State<ShowListCastMovieWidget> createState() =>
      _ShowListCastMovieWidgetState();
}

class _ShowListCastMovieWidgetState extends State<ShowListCastMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        DirectorWidget(),
        ListCastPersonWidget(),
      ],
    );
  }
}
