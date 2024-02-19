class ChartDataEntity {
  final DateTime x;
  final double high;
  final double low;
  final double open;
  final double close;

  ChartDataEntity({
    required this.x,
    required this.high,
    required this.low,
    required this.open,
    required this.close,
  });
}