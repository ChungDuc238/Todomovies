import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todomovies/common/common.dart';
import 'package:todomovies/views/pages/detail_cast_person_page/detail_cast_person_page.dart';

class AppBarDetailPerson extends StatelessWidget {
  const AppBarDetailPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataDetailCasPerson.of(context)?.snapshot;
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 30),
          child: Container(
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.red,
                      ),
                      Text(
                        'Back',
                        style: textStyle.copyWith(
                            color: Colors.red, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 54.0),
                    child: Text(
                      '${snapshot?.data?.name}',
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
