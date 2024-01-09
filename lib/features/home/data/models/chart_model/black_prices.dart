import 'package:black_market/features/home/data/models/chart_model/currency_id.dart';
import 'package:black_market/features/home/data/models/chart_model/currency_id_blackm.dart';

class CurrynciesBlackPrices {
  List<CurrencyIdBlack>? currcenyIdBlack;

  CurrynciesBlackPrices({this.currcenyIdBlack});

  factory CurrynciesBlackPrices.fromJson(Map<String, dynamic> json, int id) =>
      CurrynciesBlackPrices(
        currcenyIdBlack: (json['$id'] as List<dynamic>?)
            ?.map((e) => CurrencyIdBlack.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
