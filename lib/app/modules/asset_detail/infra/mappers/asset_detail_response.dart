import '../../domain/domain.dart';

class AssetDetailResponse {
  final int? timeStamp;
  final double? open;
  final double? close;
  final int? volume;
  final double? high;
  final double? low;
  final double? percentageVariation;
  final double? percentageChangeSinceFirstTradingDay;

  AssetDetailResponse({
    this.timeStamp,
    this.open,
    this.close,
    this.volume,
    this.high,
    this.low,
    this.percentageVariation,
    this.percentageChangeSinceFirstTradingDay,
  });

  factory AssetDetailResponse.fromJson(Map<dynamic, dynamic> json) =>
      AssetDetailResponse(
        timeStamp: json["timeStamp"],
        open: json["open"],
        close: json["close"],
        volume: json["volume"],
        high: json["high"],
        low: json["low"],
        percentageVariation: json["percentageVariation"],
        percentageChangeSinceFirstTradingDay: json["percentageChangeSinceFirstTradingDay"],
      );

  AssetDetailEntity toEntity() {
    return AssetDetailEntity(
      timeStamp: timeStamp,
      open: open,
      close: close,
      volume: volume,
      high: high,
      low: low,
      percentageVariation: percentageVariation,
      percentageChangeSinceFirstTradingDay: percentageChangeSinceFirstTradingDay,
    );
  }
}
