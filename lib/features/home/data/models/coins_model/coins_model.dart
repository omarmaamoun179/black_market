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
  String? lastUpdate;
  dynamic createdAt;
  String? updatedAt;
  List<LivePrice>? livePrices;
  List<BlackMarketPrice>? blackMarketPrices;
  List<dynamic>? bankPrices;

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
        lastUpdate: json['last_update'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as String?,
        livePrices: (json['live_prices'] as List<dynamic>?)
            ?.map((e) => LivePrice.fromJson(e as Map<String, dynamic>))
            .toList(),
        blackMarketPrices: (json['black_market_prices'] as List<dynamic>?)
            ?.map((e) => BlackMarketPrice.fromJson(e as Map<String, dynamic>))
            .toList(),
        bankPrices: json['bank_prices'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'banner': banner,
        'icon': icon,
        'name': name,
        'code': code,
        'can_be_main': canBeMain,
        'sort': sort,
        'show_network_image': showNetworkImage,
        'last_update': lastUpdate,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'live_prices': livePrices?.map((e) => e.toJson()).toList(),
        'black_market_prices':
            blackMarketPrices?.map((e) => e.toJson()).toList(),
        'bank_prices': bankPrices,
      };
}
