class BanksModel {
  int? id;
  dynamic banner;
  String? icon;
  String? name;
  dynamic hotline;
  int? calculateBasedOnBank;
  int? sort;
  int? showNetworkImage;
  int? isVirtual;
  String? shortname;
  int? active;
  String? createdAt;
  String? updatedAt;
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'banner': banner,
        'icon': icon,
        'name': name,
        'hotline': hotline,
        'calculate_based_on_bank': calculateBasedOnBank,
        'sort': sort,
        'show_network_image': showNetworkImage,
        'is_virtual': isVirtual,
        'shortname': shortname,
        'active': active,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'branches': branches,
      };
}
