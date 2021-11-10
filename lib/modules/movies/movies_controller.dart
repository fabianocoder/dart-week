import 'package:dartweek/application/ui/messages/messages_mixin.dart';
import 'package:dartweek/models/genre_model.dart';
import 'package:dartweek/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  MoviesController({required GenresService genresService})
      : _genresService = genresService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      print("teste");
      print(genres);
      this.genres.assignAll(genres);
    } catch (e) {
      _message(
          MessageModel.error(title: "erro", message: "erro ao buscar genres"));
    }
  }
}
