import '../../domain/entities/trading_periods_entity.dart';

class TradingPeriodsResponse {
  final String timezone;
  final int start;
  final int end;
  final int gmtoffset;

  TradingPeriodsResponse({
    required this.timezone,
    required this.start,
    required this.end,
    required this.gmtoffset,
  });

  factory TradingPeriodsResponse.fromJson(Map<String, dynamic> json) =>
      TradingPeriodsResponse(
        timezone: json["timezone"],
        start: json["start"],
        end: json["end"],
        gmtoffset: json["gmtoffset"],
      );

  TradingPeriodsEntity toEntity() {
    return TradingPeriodsEntity(
      timezone: timezone,
      start: start,
      end: end,
      gmtoffset: gmtoffset,
    );
  }
}
