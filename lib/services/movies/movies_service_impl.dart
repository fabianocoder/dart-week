import 'package:dartweek/models/movie_detail_model.dart';
import 'package:dartweek/models/movie_model.dart';
import 'package:dartweek/repositories/movies/movies_repository.dart';
import 'package:dartweek/services/movies/movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;
  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;
  @override
  Future<List<MovieModel>> getPopularMovie() {
    return _moviesRepository.getPopularMovie();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() {
    return _moviesRepository.getTopRatedMovie();
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) {
    return _moviesRepository.getDetail(id);
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) =>
      _moviesRepository.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) =>
      _moviesRepository.getFavoritiesMovies(userId);
}
