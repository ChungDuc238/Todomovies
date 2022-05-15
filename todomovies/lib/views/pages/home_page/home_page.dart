
import 'package:flutter/material.dart';
import 'package:todomovies/views/widgets/stateful/bottom_nav_widget.dart';
import 'package:todomovies/views/widgets/stateless/body_home_view.dart';
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            BodyInHomeView(tabController: _tabController),
            Positioned(
              child: TabBarWidget(
                  tabController: _tabController,
                  selectedItemTabBar: _selectedItemTabBar),
            ),
            const Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationWidget()),
          ],
        ),
      ),
      // bottomNavigationBar: ClipRect(
      //   child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      //     child: const BottomNavigationWidget(),
      //   ),
      // ),
    );
  }
}
