import 'package:dartweek/application/rest_client/rest_client.dart';
import 'package:dartweek/models/genre_model.dart';
import 'package:dartweek/repositories/genres/genres_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required restClient}) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>('genre/movie/list',
        query: {
          'api_key': RemoteConfig.instance.getString('api_token'),
          'language': 'pt-Br'
        }, decoder: (data) {
      print("resultado");
      print(data['genres']);
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GenreModel>((g) => GenreModel.fromMap(g))
            .toList();
      }
      return <GenreModel>[];
    });
    if (result.hasError) {
      print(result.statusText);
      throw Exception("Erro ao buscar Genres");
    }
    // print(result.statusCode);
    return result.body ?? <GenreModel>[];
  }
}
