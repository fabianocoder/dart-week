import 'package:dartweek/application/modules/module.dart';
import 'package:dartweek/modules/movie_detail/movie_detail_binding.dart';
import 'package:dartweek/modules/movie_detail/movie_detail_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => MovieDetailPage(),
      binding: MovieDetailBindings(),
    )
  ];
}
