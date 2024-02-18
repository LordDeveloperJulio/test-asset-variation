class AssetEntity {
  final String symbol;
  final String? name;
  final dynamic price;
  final String? exchange;
  final String? exchangeShortName;
  final String type;

  AssetEntity({
    required this.symbol,
    this.name,
    required this.price,
    this.exchange,
    this.exchangeShortName,
    required this.type,
  });
}
