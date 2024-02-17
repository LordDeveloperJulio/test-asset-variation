class TradingPeriodsEntity {
  final String timezone;
  final int start;
  final int end;
  final int gmtoffset;

  TradingPeriodsEntity({
    required this.timezone,
    required this.start,
    required this.end,
    required this.gmtoffset,
  });
}
