class LivePrice {
  int? id;
  int? currencyId;
  String? date;
  int? hour;
  dynamic? price;
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
        price: json['price'] ,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'currency_id': currencyId,
        'date': date,
        'hour': hour,
        'price': price,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
      int getTimeDifferenceInMinutes() {
    // Check if createdAt is not null
    if (createdAt != null) {
      // Get the current time
      DateTime currentTime = DateTime.now();

      // Calculate the difference in minutes
      Duration difference = currentTime.difference(createdAt!);
      int differenceInMinutes = difference.inMinutes;

      return differenceInMinutes;
    } else {
      // Handle the case where createdAt is null
      return 0;
    }
  }

}
