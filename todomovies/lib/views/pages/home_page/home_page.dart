import 'package:flutter/material.dart';
import 'package:todomovies/views/widgets/stateless/tabbar_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this);
  int _selectedItemTabBar = 0;

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedItemTabBar = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: TabBarWidget(
                    tabController: _tabController,
                    selectedItemTabBar: _selectedItemTabBar),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
