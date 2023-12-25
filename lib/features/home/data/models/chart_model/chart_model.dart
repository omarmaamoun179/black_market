import 'live_prices.dart';

class ChartModel {
CurrynciesLivePrices? livePrices;

  ChartModel({this.livePrices});

  factory ChartModel.fromJson(Map<String, dynamic> json , int id) => ChartModel(
        livePrices: json['live_prices'] == null
            ? null
            :CurrynciesLivePrices.fromJson(json['live_prices'] as Map<String, dynamic> ,id   ),
      );

 
}
