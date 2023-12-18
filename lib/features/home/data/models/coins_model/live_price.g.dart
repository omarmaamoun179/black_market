// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LivePriceAdapter extends TypeAdapter<LivePrice> {
  @override
  final int typeId = 3;

  @override
  LivePrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LivePrice(
      id: fields[0] as int?,
      currencyId: fields[1] as int?,
      date: fields[2] as String?,
      hour: fields[3] as int?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, LivePrice obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.currencyId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.hour)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LivePriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
