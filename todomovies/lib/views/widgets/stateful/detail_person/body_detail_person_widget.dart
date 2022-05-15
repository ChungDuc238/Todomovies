import 'package:flutter/material.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';
import 'package:todomovies/views/widgets/stateless/background_image_person_widget.dart';
import 'package:todomovies/views/widgets/stateless/infor_person_widget.dart';

class BodyDetailPerson extends StatefulWidget {
  const BodyDetailPerson({Key? key}) : super(key: key);

  @override
  State<BodyDetailPerson> createState() => _BodyDetailPersonState();
}

class _BodyDetailPersonState extends State<BodyDetailPerson> {
  @override
  Widget build(BuildContext context) {
    final String? imageBackgroundPath =
        InheritedDataDetailCasPerson.of(context)?.imageBackground;
    return Stack(
      children: [
        BackgroundImageProflie(imageBackgroundPath: imageBackgroundPath),
        Positioned.fill(
          top: 80,
          child: InforPerson(imageBackgroundPath: imageBackgroundPath),
        ),
      ],
    );
  }
}
