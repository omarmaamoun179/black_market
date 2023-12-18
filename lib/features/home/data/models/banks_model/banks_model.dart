import 'package:hive/hive.dart';
part 'banks_model.g.dart';

@HiveType(typeId: 0)
class BanksModel  {
  @HiveField(0)
  int? id;
  @HiveField(1)
  dynamic banner;
  @HiveField(2)
  String? icon;
  @HiveField(3)
  String? name;
  @HiveField(4)
  dynamic hotline;
  @HiveField(5)
  int? calculateBasedOnBank;
  @HiveField(6)
  int? sort;
  @HiveField(7)
  int? showNetworkImage;
  @HiveField(8)
  int? isVirtual;
  @HiveField(9)
  String? shortname;
  @HiveField(10)
  int? active;
  @HiveField(11)
  String? createdAt;
  @HiveField(12)
  String? updatedAt;
  @HiveField(13)
  List<dynamic>? branches;
  

  BanksModel({
    this.id,
    this.banner,
    this.icon,
    this.name,
    this.hotline,
    this.calculateBasedOnBank,
    this.sort,
    this.showNetworkImage,
    this.isVirtual,
    this.shortname,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.branches,
  });

  factory BanksModel.fromJson(Map<String, dynamic> json) => BanksModel(
        id: json['id'] as int?,
        banner: json['banner'] as dynamic,
        icon: json['icon'] as String?,
        name: json['name'] as String?,
        hotline: json['hotline'] as dynamic,
        calculateBasedOnBank: json['calculate_based_on_bank'] as int?,
        sort: json['sort'] as int?,
        showNetworkImage: json['show_network_image'] as int?,
        isVirtual: json['is_virtual'] as int?,
        shortname: json['shortname'] as String?,
        active: json['active'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        branches: json['branches'] as List<dynamic>?,
      );
}
