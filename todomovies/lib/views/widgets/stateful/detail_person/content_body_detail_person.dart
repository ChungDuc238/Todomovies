import 'package:flutter/material.dart';
import 'package:todomovies/views/widgets/stateful/detail_person/header_body_detail_person_widget.dart';
import 'package:todomovies/views/widgets/stateless/biography_detail_person_widget.dart';

class ContentBodyDetailWidget extends StatefulWidget {
  const ContentBodyDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentBodyDetailWidget> createState() =>
      _ContentBodyDetailWidgetState();
}

class _ContentBodyDetailWidgetState extends State<ContentBodyDetailWidget>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  @override
  void initState() {
    super.initState();
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.black,
          child: HeaderBodyDetailPersonWidget(tabController: _tabController),
        ),
        BiographyWidget(tabController: _tabController),
      ],
    );
  }
}
