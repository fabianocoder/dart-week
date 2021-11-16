import 'package:dartweek/application/rest_client/rest_client.dart';
import 'package:dartweek/models/movie_detail_model.dart';
import 'package:dartweek/models/movie_model.dart';
import 'package:dartweek/repositories/movies/movies_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  MoviesRepositoryImpl({required restClient}) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    print("entrando getPopularMovie");
    final result =
        await _restClient.get<List<MovieModel>>('movie/popular/', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    }, decoder: (data) {
      print("passando getPopularMovie");
      final results = data['results'];
      if (results != "") {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Erro ao buscar movies');
      throw Exception("Erro ao buscar moviessss");
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    print("entrando getTopRatedMovie");
    final result =
        await _restClient.get<List<MovieModel>>('movie/top_rated/', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    }, decoder: (data) {
      print("passando getTopRatedMovie");
      final results = data['results'];
      if (results != "") {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Erro ao buscar movies');
      throw Exception("Erro ao buscar moviessss");
    }
    print(result.statusCode);
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
        'append_to_response': 'images,credits',
        'include_image_language': 'en, pt-Br',
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );

    if (result.hasError) {
      print('Erro ao buscar detalhar dos filmes');
      throw Exception("Erro ao buscar moviessss");
    }
    print(result.statusCode);
    return result.body;
  }
}
