import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';
class BiographyWidget extends StatelessWidget {
  const BiographyWidget({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataDetailCasPerson.of(context)?.snapshot;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFF49464b),
      padding: const EdgeInsets.all(8),
      // width: double.infinity,
      // height: double.infinity,
      child: TabBarView(
        controller: _tabController,
        children: [
          SizedBox(
            width: 30,
            height: 30.0,
            child: Text(
              '${snapshot?.data?.biography}',
              style: textStyle.copyWith(fontSize: 18.0, height: 1.3),
            ),
          ),
          const SizedBox(
            width: 30,
            height: 30.0,
            child: Text('Top list2'),
          ),
        ],
      ),
    );
  }
}
