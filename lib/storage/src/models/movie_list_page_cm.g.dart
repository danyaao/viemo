// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_page_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieListPageCMAdapter extends TypeAdapter<MovieListPageCM> {
  @override
  final int typeId = 1;

  @override
  MovieListPageCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieListPageCM(
      movieList: (fields[0] as List).cast<MovieCM>(),
      totalPages: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieListPageCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.movieList)
      ..writeByte(1)
      ..write(obj.totalPages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListPageCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
