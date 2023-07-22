// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListPageRM _$MovieListPageRMFromJson(Map<String, dynamic> json) =>
    MovieListPageRM(
      movieList: (json['docs'] as List<dynamic>)
          .map((e) => MovieRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['pages'] as int,
    );
