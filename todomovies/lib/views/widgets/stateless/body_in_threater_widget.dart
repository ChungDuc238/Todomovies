import 'package:flutter/material.dart';
import 'package:todomovies/views/pages/home_page/in_threaters_page.dart';

class BodyInThreaterWidget extends StatelessWidget {
  const BodyInThreaterWidget({
    Key? key,
    required TabController tabController,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 300,
      color: const Color(0xFF49464b),
      // width: double.infinity,
      // height: double.infinity,
      child: TabBarView(
        controller: _tabController,
        children: const [
          InThreaterPage(),
          SizedBox(
            width: 30,
            height: 30.0,
            child: Text('Top list1'),
          ),
          SizedBox(
            width: 30,
            height: 30.0,
            child: Text('Top list2'),
          ),
          SizedBox(
            width: 30,
            height: 30.0,
            child: Text('Top list2'),
          ),
        ],
      ),
    );
  }
}