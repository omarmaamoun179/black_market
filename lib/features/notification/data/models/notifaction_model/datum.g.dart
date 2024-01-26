// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatumNotsAdapter extends TypeAdapter<DatumNots> {
  @override
  final int typeId = 7;

  @override
  DatumNots read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatumNots(
      id: fields[0] as int?,
      topic: fields[1] as String?,
      title: fields[2] as String?,
      body: fields[3] as String?,
      scheduleAt: fields[4] as DateTime?,
      appId: fields[5] as dynamic,
      showToUsers: fields[6] as int?,
      articleId: fields[7] as dynamic,
      link: fields[8] as dynamic,
      createdAt: fields[9] as DateTime?,
      updatedAt: fields[10] as DateTime?,
      readsCount: fields[11] as int?,
      notificationDate: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DatumNots obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.topic)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.body)
      ..writeByte(4)
      ..write(obj.scheduleAt)
      ..writeByte(5)
      ..write(obj.appId)
      ..writeByte(6)
      ..write(obj.showToUsers)
      ..writeByte(7)
      ..write(obj.articleId)
      ..writeByte(8)
      ..write(obj.link)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.readsCount)
      ..writeByte(12)
      ..write(obj.notificationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatumNotsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
