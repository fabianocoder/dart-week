import 'package:dartweek/modules/movie_detail/movie_detail_controller.dart';
import 'package:dartweek/modules/movie_detail/widget/movie_detail_content/movie_detail_content.dart';
import 'package:dartweek/modules/movie_detail/widget/movie_detail_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalhe",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailHeader(movie: controller.movie.value),
            MovieDetailContent(movie: controller.movie.value),
          ],
        );
      })),
    );
  }
}
