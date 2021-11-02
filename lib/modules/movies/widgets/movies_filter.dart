import 'package:dartweek/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'filter_tag.dart';

class MoviesFilter extends GetView<MoviesController> {
  const MoviesFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            return Row(
              children: controller.genres.map((g) => FilterTag()).toList(),
            );
          }),
        ));
  }
}
