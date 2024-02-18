import '../../domain/entities/asset_entity.dart';

class AssetResponse {
  final String symbol;
  final String? name;
  final dynamic price;
  final String? exchange;
  final String? exchangeShortName;
  final String type;

  AssetResponse({
    required this.symbol,
    this.name,
    required this.price,
    this.exchange,
    this.exchangeShortName,
    required this.type,
  });

  factory AssetResponse.fromJson(Map<dynamic, dynamic> json) => AssetResponse(
        symbol: json["symbol"],
        name: json["name"],
        price: json["price"],
        exchange: json["exchange"],
        exchangeShortName: json["exchangeShortName"],
        type: json["type"],
      );

  AssetEntity toEntity() {
    return AssetEntity(
      symbol: symbol,
      name: name,
      price: price,
      exchangeShortName: exchangeShortName,
      type: type,
    );
  }
}
