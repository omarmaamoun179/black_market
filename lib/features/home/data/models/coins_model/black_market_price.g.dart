// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'black_market_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlackMarketPriceAdapter extends TypeAdapter<BlackMarketPrice> {
  @override
  final int typeId = 4;

  @override
  BlackMarketPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlackMarketPrice(
      id: fields[0] as int?,
      currencyId: fields[1] as int?,
      buyPrice: fields[2] as double?,
      sellPrice: fields[3] as double?,
      date: fields[4] as String?,
      hour: fields[5] as int?,
      createdAt: fields[6] as DateTime?,
      updatedAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BlackMarketPrice obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.currencyId)
      ..writeByte(2)
      ..write(obj.buyPrice)
      ..writeByte(3)
      ..write(obj.sellPrice)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.hour)
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
      other is BlackMarketPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
