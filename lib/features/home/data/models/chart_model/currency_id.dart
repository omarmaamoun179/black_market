class CurrencyId {
  int? currencyId;
  double? price;
  String? date;
  int? hour;

  CurrencyId({this.currencyId, this.price, this.date, this.hour});

  factory CurrencyId.fromJson(Map<String, dynamic> json) => CurrencyId(
        currencyId: json['currency_id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        date: json['date'] as String?,
        hour: json['hour'] as int?,
      );
}
