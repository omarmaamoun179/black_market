// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banks_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BanksModelAdapter extends TypeAdapter<BanksModel> {
  @override
  final int typeId = 0;

  @override
  BanksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BanksModel(
      id: fields[0] as int?,
      banner: fields[1] as dynamic,
      icon: fields[2] as String?,
      name: fields[3] as String?,
      hotline: fields[4] as dynamic,
      calculateBasedOnBank: fields[5] as int?,
      sort: fields[6] as int?,
      showNetworkImage: fields[7] as int?,
      isVirtual: fields[8] as int?,
      shortname: fields[9] as String?,
      active: fields[10] as int?,
      createdAt: fields[11] as String?,
      updatedAt: fields[12] as String?,
      branches: (fields[13] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, BanksModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.banner)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.hotline)
      ..writeByte(5)
      ..write(obj.calculateBasedOnBank)
      ..writeByte(6)
      ..write(obj.sort)
      ..writeByte(7)
      ..write(obj.showNetworkImage)
      ..writeByte(8)
      ..write(obj.isVirtual)
      ..writeByte(9)
      ..write(obj.shortname)
      ..writeByte(10)
      ..write(obj.active)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.branches);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BanksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
