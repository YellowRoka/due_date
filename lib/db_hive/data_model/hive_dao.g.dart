// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDAOAdapter extends TypeAdapter<HiveDAO> {
  @override
  final int typeId = 1;

  @override
  HiveDAO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDAO(
      fields[0] as DateTime,
      fields[1] as DateTime?,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDAO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bugDate)
      ..writeByte(1)
      ..write(obj.fixDate)
      ..writeByte(2)
      ..write(obj.turnroundTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDAOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
