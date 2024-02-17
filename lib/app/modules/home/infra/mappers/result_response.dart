import '../../domain/entities/result_entity.dart';
import 'indicators_response.dart';
import 'meta_response.dart';

class ResultResponse {
  final MetaResponse meta;
  final List<int> timestamp;
  final IndicatorsResponse indicators;

  ResultResponse({
    required this.meta,
    required this.timestamp,
    required this.indicators,
  });

  factory ResultResponse.fromJson(Map<String, dynamic> json) => ResultResponse(
        meta: MetaResponse.fromJson(json["meta"]),
        timestamp: List<int>.from(json["timestamp"]),
        indicators: IndicatorsResponse.fromJson(json["indicators"]),
      );

  ResultEntity toEntity() {
    return ResultEntity(
      meta: meta.toEntity(),
      timestamp: timestamp.map((element) {
        return element;
      }).toList(),
      indicators: indicators.toEntity(),
    );
  }
}
