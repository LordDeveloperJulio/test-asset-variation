import 'package:test_asset_variation/app/modules/home/domain/entities/result_entity.dart';

class ChartEntity {
  final List<ResultEntity> result;
  final String? error;

  ChartEntity({required this.result, this.error});
}
