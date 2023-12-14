import 'bank_price.dart';
import 'black_market_price.dart';
import 'live_price.dart';

class CoinsModel {
  int? id;
  dynamic banner;
  String? icon;
  String? name;
  String? code;
  int? canBeMain;
  int? sort;
  int? showNetworkImage;
  DateTime? lastUpdate;
  dynamic createdAt;
  DateTime? updatedAt;
  List<LivePrice>? livePrices;
  List<BlackMarketPrice>? blackMarketPrices;
  List<BankPrice>? bankPrices;

  CoinsModel({
    this.id,
    this.banner,
    this.icon,
    this.name,
    this.code,
    this.canBeMain,
    this.sort,
    this.showNetworkImage,
    this.lastUpdate,
    this.createdAt,
    this.updatedAt,
    this.livePrices,
    this.blackMarketPrices,
    this.bankPrices,
  });

  factory CoinsModel.fromJson(Map<String, dynamic> json) => CoinsModel(
        id: json['id'] as int?,
        banner: json['banner'] as dynamic,
        icon: json['icon'] as String?,
        name: json['name'] as String?,
        code: json['code'] as String?,
        canBeMain: json['can_be_main'] as int?,
        sort: json['sort'] as int?,
        showNetworkImage: json['show_network_image'] as int?,
        lastUpdate: json['last_update'] == null
            ? null
            : DateTime.parse(json['last_update'] as String),
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        livePrices: (json['live_prices'] as List<dynamic>?)
            ?.map((e) => LivePrice.fromJson(e as Map<String, dynamic>))
            .toList(),
        blackMarketPrices: (json['black_market_prices'] as List<dynamic>?)
            ?.map((e) => BlackMarketPrice.fromJson(e as Map<String, dynamic>))
            .toList(),
        bankPrices: (json['bank_prices'] as List<dynamic>?)
            ?.map((e) => BankPrice.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
