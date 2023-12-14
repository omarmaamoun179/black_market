class CompaniesDatum {
  int? id;
  int? companyId;
  int? ingotId;
  dynamic? workmanship;
  dynamic? tax;
  dynamic? returnFees;
  DateTime? createdAt;
  DateTime? updatedAt;

  CompaniesDatum({
    this.id,
    this.companyId,
    this.ingotId,
    this.workmanship,
    this.tax,
    this.returnFees,
    this.createdAt,
    this.updatedAt,
  });

  factory CompaniesDatum.fromJson(Map<String, dynamic> json) {
    return CompaniesDatum(
      id: json['id'] as int?,
      companyId: json['company_id'] as int?,
      ingotId: json['ingot_id'] as int?,
      workmanship: json['workmanship'],
      tax: json['tax'],
      returnFees: json['return_fees'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }
}
