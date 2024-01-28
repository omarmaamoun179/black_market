class CurrencyIdBlack {
  int? currencyId;
  double? price;
  String? date;
  int? hour;

  CurrencyIdBlack({this.currencyId, this.price, this.date, this.hour});

  factory CurrencyIdBlack.fromJson(Map<String, dynamic> json) =>
      CurrencyIdBlack(
        currencyId: json['currency_id'] as int?,
        price: (json['sell_price'] as num?)?.toDouble(),
        date: json['date'] as String?,
        hour: json['hour'] as int?,
      );
}
