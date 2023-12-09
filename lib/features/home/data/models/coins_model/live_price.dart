class LivePrice {
  int? id;
  int? currencyId;
  String? date;
  int? hour;
  double? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  LivePrice({
    this.id,
    this.currencyId,
    this.date,
    this.hour,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory LivePrice.fromJson(Map<String, dynamic> json) => LivePrice(
        id: json['id'] as int?,
        currencyId: json['currency_id'] as int?,
        date: json['date'] as String?,
        hour: json['hour'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

 
}
