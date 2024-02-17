import '../../domain/entities/quote_entity.dart';

class QuoteResponse {
  final List<double> low;
  final List<int> volume;
  final List<double> high;
  final List<double> open;
  final List<double> close;

  QuoteResponse({
    required this.low,
    required this.volume,
    required this.high,
    required this.open,
    required this.close,
  });

  factory QuoteResponse.fromJson(Map<String, dynamic> json) => QuoteResponse(
        low: List<double>.from(json["low"]),
        volume: List<int>.from(json["volume"]),
        high: List<double>.from(json["high"]),
        open: List<double>.from(json["open"]),
        close: List<double>.from(json["close"]),
      );

  QuoteEntity toEntity() {
    return QuoteEntity(
      low: low.map((element) {
        return element;
      }).toList(),
      volume: volume.map((element) {
        return element;
      }).toList(),
      high: high.map((element) {
        return element;
      }).toList(),
      open: open.map((element) {
        return element;
      }).toList(),
      close: close.map((element) {
        return element;
      }).toList(),
    );
  }
}
