// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieCMAdapter extends TypeAdapter<MovieCM> {
  @override
  final int typeId = 0;

  @override
  MovieCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieCM(
      id: fields[0] as int,
      title: fields[1] as String,
      rating: fields[2] as RatingCM,
      duration: fields[3] as int,
      type: fields[4] as String,
      description: fields[5] as String,
      year: fields[6] as int,
      poster: fields[7] as PosterCM,
      genres: (fields[8] as List).cast<String>(),
      countries: (fields[9] as List).cast<String>(),
      alternativeName: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieCM obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.year)
      ..writeByte(7)
      ..write(obj.poster)
      ..writeByte(8)
      ..write(obj.genres)
      ..writeByte(9)
      ..write(obj.countries)
      ..writeByte(10)
      ..write(obj.alternativeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
