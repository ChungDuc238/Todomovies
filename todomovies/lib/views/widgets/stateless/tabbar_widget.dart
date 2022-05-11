import 'package:flutter/material.dart';
import 'package:todomovies/models/tabbar_model.dart';
import 'package:todomovies/views/pages/in_threaters_page.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required TabController tabController,
    required int selectedItemTabBar,
  })  : _tabController = tabController,
        _selectedItemTabBar = selectedItemTabBar,
        super(key: key);

  final TabController _tabController;
  final int _selectedItemTabBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: const Color(0xFF49464b),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(8.0),
            // padding: EdgeInsets.symmetric(vertical: 4.0),
            child: TabBar(
              indicator: BoxDecoration(
                // color: (_tabController.index == _selectedItemTabBar)
                //     ? const Color(0xFFff3a30)
                //     : const Color(0xFFFFFFFF),
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
        ),
        Expanded(
          flex: 10,
          child: Container(
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
          ),
        ),
      ],
    );
  }
}
