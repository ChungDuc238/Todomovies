import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/common/current_year.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';
import 'package:todomovies/views/widgets/stateless/custom_avatar_widget.dart';

class InforPerson extends StatefulWidget {
  const InforPerson({
    Key? key,
    required this.imageBackgroundPath,
  }) : super(key: key);

  final String? imageBackgroundPath;

  @override
  State<InforPerson> createState() => _InforPersonState();
}

class _InforPersonState extends State<InforPerson> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CustomAvatarCircle(imagePath: widget.imageBackgroundPath!),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          _getYearOldPerson(),
          style: textStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          _getPlaceOfBirth(),
          style: textStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '12 movies',
          style: textStyle,
        ),
      ],
    );
  }

  // method get Years Old of cast person
  String _getYearOldPerson() {
    final snapshot = InheritedDataDetailCasPerson.of(context)?.snapshot;
    if (snapshot?.data?.birthday != null) {
      final yearOfBirth = snapshot?.data?.birthday!.split('-')[0];
      final yearOld =
          int.parse(CurrentYear.getCurrentYear()) - int.parse(yearOfBirth!);
      return yearOld.toString() + 'Years Old';
    }
    return 'Unknown';
  }

  // method get Place of birth
  String _getPlaceOfBirth() {
    final snapshot = InheritedDataDetailCasPerson.of(context)?.snapshot;
    return snapshot?.data?.placeOfBirth ?? 'Unknown';
  }
}
