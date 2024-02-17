import 'package:test_asset_variation/app/modules/home/domain/domain.dart';
import 'package:test_asset_variation/app/modules/home/infra/mappers/trading_periods_response.dart';

import 'current_trading_period_response.dart';

class MetaResponse {
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
  final CurrentTradingPeriodResponse currentTradingPeriod;
  final List<TradingPeriodsResponse> tradingPeriods;
  final String dataGranularity;
  final String range;
  final List<String> validRanges;

  MetaResponse({
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

  factory MetaResponse.fromJson(Map<String, dynamic> json) => MetaResponse(
        currency: json["currency"],
        symbol: json["symbol"],
        exchangeName: json["exchangeName"],
        instrumentType: json["instrumentType"],
        firstTradeDate: json["firstTradeDate"],
        regularMarketTime: json["regularMarketTime"],
        gmtoffset: json["gmtoffset"],
        timezone: json["timezone"],
        exchangeTimezoneName: json["exchangeTimezoneName"],
        regularMarketPrice: json["regularMarketPrice"],
        chartPreviousClose: json["chartPreviousClose"],
        previousClose: json["previousClose"],
        scale: json["scale"],
        priceHint: json["priceHint"],
        currentTradingPeriod:
            CurrentTradingPeriodResponse.fromJson(json["currentTradingPeriod"]),
        tradingPeriods: List<TradingPeriodsResponse>.from(json["tradingPeriods"]
            .map((element) => TradingPeriodsResponse.fromJson(element))),
        dataGranularity: json["dataGranularity"],
        range: json["range"],
        validRanges: List<String>.from(json["validRanges"]),
      );

  MetaEntity toEntity() {
    return MetaEntity(
      currency: currency,
      symbol: symbol,
      exchangeName: exchangeName,
      instrumentType: instrumentType,
      firstTradeDate: firstTradeDate,
      regularMarketTime: regularMarketTime,
      gmtoffset: gmtoffset,
      timezone: timezone,
      exchangeTimezoneName: exchangeTimezoneName,
      regularMarketPrice: regularMarketPrice,
      chartPreviousClose: chartPreviousClose,
      previousClose: previousClose,
      scale: scale,
      priceHint: priceHint,
      currentTradingPeriod: currentTradingPeriod.toEntity(),
      tradingPeriods: tradingPeriods.map((element) {
        return element.toEntity();
      }).toList(),
      dataGranularity: dataGranularity,
      range: range,
      validRanges: validRanges.map((element) {
        return element;
      }).toList(),
    );
  }
}
