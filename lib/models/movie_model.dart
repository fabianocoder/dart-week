import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String release;
  final String posterPath;
  final bool favorite;
  final List<int> genres;
  MovieModel({
    required this.id,
    required this.title,
    required this.release,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'release': release,
      'posterPath': posterPath,
      'genres': genres,
      'favorite': favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      release: map['release_date'],
      posterPath: map['poster_path'],
      genres: List<int>.from(map['genre_ids']),
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  MovieModel copyWith({
    int? id,
    String? title,
    String? release,
    String? posterPath,
    bool? favorite,
    List<int>? genres,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      release: release ?? this.release,
      posterPath: posterPath ?? this.posterPath,
      favorite: favorite ?? this.favorite,
      genres: genres ?? this.genres,
    );
  }
}
