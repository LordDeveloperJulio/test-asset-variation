class AssetDetailEntity {
  final int? timeStamp;
  final double? open;
  final double? close;
  final int? volume;
  final double? high;
  final double? low;
  final double? percentageVariation;
  final double? percentageChangeSinceFirstTradingDay;

  AssetDetailEntity({
    this.timeStamp,
    this.open,
    this.close,
    this.volume,
    this.high,
    this.low,
    this.percentageVariation,
    this.percentageChangeSinceFirstTradingDay,
  });
}
