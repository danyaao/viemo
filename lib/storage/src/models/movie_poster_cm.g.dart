// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_poster_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PosterCMAdapter extends TypeAdapter<PosterCM> {
  @override
  final int typeId = 3;

  @override
  PosterCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PosterCM(
      url: fields[0] as String,
      previewUrl: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PosterCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.previewUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PosterCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
