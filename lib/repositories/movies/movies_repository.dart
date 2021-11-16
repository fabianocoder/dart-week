import 'package:dartweek/models/movie_detail_model.dart';
import 'package:dartweek/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<MovieDetailModel?> getDetail(int id);
}
