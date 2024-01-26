// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotifactionModelAdapter extends TypeAdapter<NotifactionModel> {
  @override
  final int typeId = 6;

  @override
  NotifactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotifactionModel(
      currentPage: fields[0] as int?,
      data: (fields[1] as List?)?.cast<DatumNots>(),
      firstPageUrl: fields[2] as String?,
      from: fields[3] as int?,
      nextPageUrl: fields[4] as String?,
      path: fields[5] as String?,
      perPage: fields[6] as int?,
      prevPageUrl: fields[7] as dynamic,
      to: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, NotifactionModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.firstPageUrl)
      ..writeByte(3)
      ..write(obj.from)
      ..writeByte(4)
      ..write(obj.nextPageUrl)
      ..writeByte(5)
      ..write(obj.path)
      ..writeByte(6)
      ..write(obj.perPage)
      ..writeByte(7)
      ..write(obj.prevPageUrl)
      ..writeByte(8)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotifactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
