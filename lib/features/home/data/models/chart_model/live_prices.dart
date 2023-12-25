import 'package:black_market/features/home/data/models/chart_model/currency_id.dart';

class CurrynciesLivePrices {
  List<CurrencyId>? currcenyId;

  CurrynciesLivePrices({this.currcenyId});

  factory CurrynciesLivePrices.fromJson(Map<String, dynamic> json, int id) =>
      CurrynciesLivePrices(
        currcenyId: (json['$id'] as List<dynamic>?)
            ?.map((e) => CurrencyId.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
