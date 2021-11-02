import 'package:dartweek/modules/movies/movies_controller.dart';
import 'package:dartweek/repositories/genres/genres_repository.dart';
import 'package:dartweek/repositories/genres/genres_repository_impl.dart';
import 'package:dartweek/services/genres/genres_service_impl.dart';
import 'package:dartweek/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MovieBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut<GenresServiceImpl>(
        () => GenresServiceImpl(genresRepository: Get.find()));

    Get.lazyPut(() => MoviesController(genresService: Get.find()));
  }
}
