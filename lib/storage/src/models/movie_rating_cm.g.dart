// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rating_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingCMAdapter extends TypeAdapter<RatingCM> {
  @override
  final int typeId = 2;

  @override
  RatingCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingCM(
      kpRating: fields[0] as double,
      imdbRating: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, RatingCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.kpRating)
      ..writeByte(1)
      ..write(obj.imdbRating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
