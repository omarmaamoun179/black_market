import 'package:black_market/features/home/data/models/chart_model/black_prices.dart';
import 'package:black_market/features/home/data/models/chart_model/live_prices.dart';

class ChartModel {
  // CurrynciesLivePrices? livePrices;
  CurrynciesBlackPrices? blackprices;
  CurrynciesLivePrices? livePrices;

  ChartModel({this.blackprices, this.livePrices});

  factory ChartModel.fromJson(Map<String, dynamic> json, int id) => ChartModel(
        blackprices: json['black_market_prices'] == null
            ? null
            : CurrynciesBlackPrices.fromJson(
                json['black_market_prices'] as Map<String, dynamic>,
                id,
              ),
        livePrices: json['live_prices'] == null
            ? null
            : CurrynciesLivePrices.fromJson(
                json['live_prices'] as Map<String, dynamic>,
                id,
              ),
      );
}
