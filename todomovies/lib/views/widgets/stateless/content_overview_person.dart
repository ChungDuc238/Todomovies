import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';

class ContentOverviewPerson extends StatefulWidget {
  const ContentOverviewPerson({Key? key}) : super(key: key);

  @override
  State<ContentOverviewPerson> createState() => _ContentOverviewPersonState();
}

class _ContentOverviewPersonState extends State<ContentOverviewPerson> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataDetailCasPerson.of(context)?.snapshot;
    return Text(
      '${snapshot?.data?.biography}',
      style: textStyle.copyWith(fontSize: 18.0, height: 1.3),
    );
  }
}
