import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String release;
  final String posterPath;
  final List<int> genres;
  MovieModel({
    required this.id,
    required this.title,
    required this.release,
    required this.posterPath,
    required this.genres,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'release': release,
      'posterPath': posterPath,
      'genres': genres,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      release: map['release_date'],
      posterPath: map['poster_path'],
      genres: List<int>.from(map['genre_ids']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
