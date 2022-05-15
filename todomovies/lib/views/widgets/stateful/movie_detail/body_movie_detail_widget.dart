import 'package:flutter/material.dart';
import 'package:todomovies/network/api_helper.dart';
import 'package:todomovies/views/pages/movie_detail/movie_detail_page.dart';
import 'package:todomovies/views/widgets/stateful/movie_detail/custom_banner_movie_widget.dart';
import 'package:todomovies/views/widgets/stateful/movie_detail/my_rating_widget.dart';
import 'package:todomovies/views/widgets/stateful/movie_detail/overview_movie.dart';
import 'package:todomovies/views/widgets/stateless/click_movie_widget.dart';
import 'package:todomovies/views/widgets/stateless/overview_content_movie.dart';
import 'package:todomovies/views/widgets/stateless/production_widget.dart';
import 'package:todomovies/views/widgets/stateless/show_list_cast_movie_widget.dart';

class BodyMovieDetailWidget extends StatefulWidget {
  const BodyMovieDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyMovieDetailWidget> createState() => _BodyMovieDetailWidgetState();
}

class _BodyMovieDetailWidgetState extends State<BodyMovieDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Image.network(
                  '$urlImagePoster${snapshot?.data?.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBannerMovie(),
              ),
            ],
          ),
          const ClickMovieWidget(),
          //widget rate movie
          const MyRatingWidget(),
          const OverviewMovie(),
          const ProductionWidget(),
          const ShowListCastMovieWidget(),

        ],
      ),
    );
  }
}

//Overview Movie Widget
class OverviewMovie extends StatelessWidget {
  const OverviewMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      color: const Color(0xFF2a2a2a),
      child: Column(
        children: const [
          OverviewImageMovieWidget(),
          OverviewContenMovieWidget(),
        ],
      ),
    );
  }
}
