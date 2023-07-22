// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRM _$MovieRMFromJson(Map<String, dynamic> json) => MovieRM(
      id: json['id'] as int,
      title: json['name'] as String,
      rating: RatingRM.fromJson(json['rating'] as Map<String, dynamic>),
      duration: json['movieLength'] as int,
      type: json['type'] as String,
      description: json['description'] as String,
      year: json['year'] as int,
      poster: PosterRM.fromJson(json['poster'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>)
          .map((e) => CountryRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      alternativeName: json['alternativeName'] as String,
    );
