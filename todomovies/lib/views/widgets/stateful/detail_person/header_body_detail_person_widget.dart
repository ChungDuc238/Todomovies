import 'package:flutter/material.dart';

class HeaderBodyDetailPersonWidget extends StatefulWidget {
  final TabController _tabController;
  const HeaderBodyDetailPersonWidget(
      {Key? key, required TabController tabController})
      : _tabController = tabController,
        super(key: key);

  @override
  State<HeaderBodyDetailPersonWidget> createState() =>
      _HeaderBodyDetailPersonWidgetState();
}

class _HeaderBodyDetailPersonWidgetState
    extends State<HeaderBodyDetailPersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 40.0,
          decoration: BoxDecoration(
            color: const Color(0xFF49464b),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: TabBar(
            indicator: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            controller: widget._tabController,
            tabs: const [
              Tab(
                child: Text('Biography'),
              ),
              Tab(
                child: Text('Movies'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
