import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:myflix/src/features/domain.dart';

class Movie {
  final int id;
  final String imageUrl;
  final String title;
  final String overview;
  final List<String> categories;
  final double match;
  final double minutes;
  final String filmRate;
  final String trailerUrl;
  final String videoUrl;
  final String releaseDate;

  Movie({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.overview,
    required this.categories,
    required this.match,
    required this.minutes,
    required this.filmRate,
    required this.trailerUrl,
    required this.videoUrl,
    required this.releaseDate,
  });

  String get getStrCategories {
    String category = '';
    categories.forEachIndexed((index, element) {
      if (index == categories.length - 1) {
        category += ' $element';
      } else {
        category += ' $element,';
      }
    });
    return category;
  }

  Movie copyWith({
    int? id,
    String? imageUrl,
    String? title,
    String? overview,
    List<String>? categories,
    double? match,
    double? minutes,
    String? filmRate,
    String? trailerUrl,
    String? videoUrl,
    String? releaseDate,
  }) {
    return Movie(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      categories: categories ?? this.categories,
      match: match ?? this.match,
      minutes: minutes ?? this.minutes,
      filmRate: filmRate ?? this.filmRate,
      trailerUrl: trailerUrl ?? this.trailerUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'overview': overview,
      'categories': categories,
      'match': match,
      'minutes': minutes,
      'filmRate': filmRate,
      'trailerUrl': trailerUrl,
      'videoUrl': videoUrl,
      'releaseDate': releaseDate,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      overview: map['overview'] as String,
      categories: List<String>.from((map['categories'] as List<dynamic>)),
      match: map['match'] as double,
      minutes: map['minutes'] as double,
      filmRate: map['filmRate'] as String,
      trailerUrl: map['trailerUrl'] as String,
      videoUrl: map['videoUrl'] as String,
      releaseDate: map['releaseDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}

final dummyMovie = Movie(
  id: 1,
  imageUrl: dummyImageUrl,
  title: 'Avengers: Endgame',
  categories: ['Action', 'Scifi', 'Superheroes'],
  filmRate: '18+',
  match: 96,
  minutes: 89,
  trailerUrl: dummyVideoUrl,
  videoUrl: dummyVideoUrl,
  overview:
      'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet ',
  releaseDate: '2022-06-29',
);
