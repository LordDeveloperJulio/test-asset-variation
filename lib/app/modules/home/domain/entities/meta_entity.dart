import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

class MetaEntity {
  final String currency;
  final String symbol;
  final String exchangeName;
  final String instrumentType;
  final int firstTradeDate;
  final int regularMarketTime;
  final int gmtoffset;
  final String timezone;
  final String exchangeTimezoneName;
  final double regularMarketPrice;
  final double chartPreviousClose;
  final double previousClose;
  final int scale;
  final int priceHint;
  final CurrentTradingPeriodEntity currentTradingPeriod;
  final List<TradingPeriodsEntity> tradingPeriods;
  final String dataGranularity;
  final String range;
  final List<String> validRanges;

  MetaEntity({
    required this.currency,
    required this.symbol,
    required this.exchangeName,
    required this.instrumentType,
    required this.firstTradeDate,
    required this.regularMarketTime,
    required this.gmtoffset,
    required this.timezone,
    required this.exchangeTimezoneName,
    required this.regularMarketPrice,
    required this.chartPreviousClose,
    required this.previousClose,
    required this.scale,
    required this.priceHint,
    required this.currentTradingPeriod,
    required this.tradingPeriods,
    required this.dataGranularity,
    required this.range,
    required this.validRanges,
  });
}
