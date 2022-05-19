import 'package:flutter/material.dart';
import 'package:todomovies/views/widgets/stateful/detail_person/credit_card_person_widget.dart';
import 'package:todomovies/views/widgets/stateless/content_overview_person.dart';

class BiographyWidget extends StatelessWidget {
  const BiographyWidget({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      color: const Color(0xFF0f0f0f),
      padding: const EdgeInsets.all(8),
      // width: double.infinity,
      // height: double.infinity,
      child: TabBarView(
        controller: _tabController,
        children: const [
          ContentOverviewPerson(),
          CreditCardPerson(),
        ],
      ),
    );
  }
}
