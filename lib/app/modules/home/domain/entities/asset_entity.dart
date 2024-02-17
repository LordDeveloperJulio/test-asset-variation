class AssetEntity {
  final String symbol;
  final String? name;
  final double price;
  final String? exchange;
  final String exchangeShortName;
  final String type;

  AssetEntity({
    required this.symbol,
    this.name,
    required this.price,
    this.exchange,
    required this.exchangeShortName,
    required this.type,
  });
}
