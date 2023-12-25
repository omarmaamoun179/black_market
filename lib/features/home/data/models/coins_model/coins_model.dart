import 'package:hive/hive.dart';

import 'bank_price.dart';
import 'black_market_price.dart';
import 'live_price.dart';
part 'coins_model.g.dart';

@HiveType(typeId: 2)
class CoinsModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  dynamic banner;
  @HiveField(2)
  String? icon;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? code;
  @HiveField(5)
  int? canBeMain;
  @HiveField(6)
  int? sort;
  @HiveField(7)
  int? showNetworkImage;
  @HiveField(8)
  DateTime? lastUpdate;
  @HiveField(9)
  dynamic createdAt;
  @HiveField(10)
  DateTime? updatedAt;
  @HiveField(11)
  List<LivePrice>? livePrices;
  @HiveField(12)
  List<BlackMarketPrice>? blackMarketPrices;
  @HiveField(13)
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
