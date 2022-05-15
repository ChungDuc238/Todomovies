import 'package:flutter/material.dart';
import 'package:todomovies/views/widgets/stateful/detail_person/body_detail_person_widget.dart';
import 'package:todomovies/views/widgets/stateful/detail_person/content_body_detail_person.dart';
import 'package:todomovies/views/widgets/stateless/app_bar_detail_person_widget.dart';

class DetailCasPersonWidget extends StatefulWidget {
  const DetailCasPersonWidget({Key? key}) : super(key: key);

  @override
  State<DetailCasPersonWidget> createState() => _DetailCasPersonWidgetState();
}

class _DetailCasPersonWidgetState extends State<DetailCasPersonWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.black,
                child: const BodyDetailPerson(),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBarDetailPerson(),
              ),
            ],
          ),
          const ContentBodyDetailWidget(),
        ],
      ),
    );
  }
}
