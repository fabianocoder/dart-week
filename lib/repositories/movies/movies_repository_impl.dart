import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      print("user");
      print(userId);
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorities')
          .doc(userId)
          .collection('movies');
      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        var docs = favoriteData.docs;
        // for (var doc in docs) {
        //   doc.reference.delete();
        // }
        // or
        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      print("erro ao favoritar filme");
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) async {
    var favoritiesMovies =
        await FirebaseFirestore.instance.collection("favorites").get();

    final listFavorites = <MovieModel>[];
    for (var movie in favoritiesMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorites;
  }
}
