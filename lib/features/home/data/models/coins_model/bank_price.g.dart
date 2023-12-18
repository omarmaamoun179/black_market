// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankPriceAdapter extends TypeAdapter<BankPrice> {
  @override
  final int typeId = 5;

  @override
  BankPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankPrice(
      id: fields[0] as int?,
      bankId: fields[1] as int?,
      currencyId: fields[2] as int?,
      buyPrice: fields[3] as double?,
      sellPrice: fields[4] as double?,
      date: fields[5] as String?,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BankPrice obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bankId)
      ..writeByte(2)
      ..write(obj.currencyId)
      ..writeByte(3)
      ..write(obj.buyPrice)
      ..writeByte(4)
      ..write(obj.sellPrice)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
