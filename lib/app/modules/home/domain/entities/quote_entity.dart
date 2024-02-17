class QuoteEntity {
  final List<double> low;
  final List<int> volume;
  final List<double> high;
  final List<double> open;
  final List<double> close;

  QuoteEntity({
    required this.low,
    required this.volume,
    required this.high,
    required this.open,
    required this.close,
  });
}
