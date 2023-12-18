// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinsModelAdapter extends TypeAdapter<CoinsModel> {
  @override
  final int typeId = 2;

  @override
  CoinsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinsModel(
      id: fields[0] as int?,
      banner: fields[1] as dynamic,
      icon: fields[2] as String?,
      name: fields[3] as String?,
      code: fields[4] as String?,
      canBeMain: fields[5] as int?,
      sort: fields[6] as int?,
      showNetworkImage: fields[7] as int?,
      lastUpdate: fields[8] as DateTime?,
      createdAt: fields[9] as dynamic,
      updatedAt: fields[10] as DateTime?,
      livePrices: (fields[11] as List?)?.cast<LivePrice>(),
      blackMarketPrices: (fields[12] as List?)?.cast<BlackMarketPrice>(),
      bankPrices: (fields[13] as List?)?.cast<BankPrice>(),
    );
  }

  @override
  void write(BinaryWriter writer, CoinsModel obj) {
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
      ..write(obj.code)
      ..writeByte(5)
      ..write(obj.canBeMain)
      ..writeByte(6)
      ..write(obj.sort)
      ..writeByte(7)
      ..write(obj.showNetworkImage)
      ..writeByte(8)
      ..write(obj.lastUpdate)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.livePrices)
      ..writeByte(12)
      ..write(obj.blackMarketPrices)
      ..writeByte(13)
      ..write(obj.bankPrices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
