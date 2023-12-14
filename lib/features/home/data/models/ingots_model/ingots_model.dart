import 'coin.dart';
import 'ingot.dart';

class IngotsModel {
  List<Ingot>? ingots;
  List<Coin>? coins;

  IngotsModel({this.ingots, this.coins});

  factory IngotsModel.fromJson(Map<String, dynamic> json) => IngotsModel(
        ingots: (json['ingots'] as List<dynamic>?)
            ?.map((e) => Ingot.fromJson(e as Map<String, dynamic>))
            .toList(),
        coins: (json['coins'] as List<dynamic>?)
            ?.map((e) => Coin.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
