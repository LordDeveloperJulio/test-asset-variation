import 'indicators_entity.dart';
import 'meta_entity.dart';

class ResultEntity {
  final MetaEntity meta;
  final List<int> timestamp;
  final IndicatorsEntity indicators;

  ResultEntity({
    required this.meta,
    required this.timestamp,
    required this.indicators,
  });
}
