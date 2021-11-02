import 'package:dartweek/models/genre_model.dart';

abstract class GenresRepository {
  Future<List<GenreModel>> getGenres();
}
