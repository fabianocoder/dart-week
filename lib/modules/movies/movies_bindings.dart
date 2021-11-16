import 'package:dartweek/application/rest_client/rest_client.dart';
import 'package:dartweek/modules/movies/movies_controller.dart';
import 'package:dartweek/repositories/genres/genres_repository.dart';
import 'package:dartweek/repositories/genres/genres_repository_impl.dart';
import 'package:dartweek/services/genres/genres_service_impl.dart';
import 'package:dartweek/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MovieBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(restClient: Get.find<RestClient>()),
    );

    Get.lazyPut<GenresService>(
      () => GenresServiceImpl(
        genresRepository: Get.find(),
      ),
    );

    Get.lazyPut(() => MoviesController(
          genresService: Get.find(),
          moviesService: Get.find(),
        ));
  }
}
