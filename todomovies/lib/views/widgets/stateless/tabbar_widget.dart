import 'package:flutter/material.dart';
import 'package:todomovies/models/tabbar_model.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required TabController tabController,
    required int selectedItemTabBar,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
            color: const Color(0xFF49464b),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(8.0),
          child: TabBar(
            indicator: BoxDecoration(
              color: const Color(0xFFff3a30),
              borderRadius: BorderRadius.circular(10),
            ),
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(listItemTabBar[0].title),
              ),
              Tab(
                text: listItemTabBar[1].title,
              ),
              Tab(
                text: listItemTabBar[2].title,
              ),
              Tab(
                text: listItemTabBar[3].title,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
