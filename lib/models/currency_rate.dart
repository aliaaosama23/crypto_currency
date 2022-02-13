class CurrencyRate {
  final String time;
  final String assetIdBase;
  final String assetIdQuote;
  final double rate;
  CurrencyRate({
    required this.time,
    required this.assetIdBase,
    required this.assetIdQuote,
    required this.rate,
  });

  factory CurrencyRate.fromJson(Map<String, dynamic> json) {
    return CurrencyRate(
      time: json['time'],
      assetIdBase: json['asset_id_base'],
      assetIdQuote: json['asset_id_quote'],
      rate: json['rate'],
    );
  }
}
