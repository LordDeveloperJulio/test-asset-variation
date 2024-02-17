import 'package:test_asset_variation/app/modules/home/infra/mappers/result_response.dart';

import '../../domain/entities/chart_entity.dart';

class ChartResponse {
  final List<ResultResponse> result;
  final String? error;

  ChartResponse({required this.result, this.error});

  factory ChartResponse.fromJson(Map<String, dynamic> json) => ChartResponse(
        result: List<ResultResponse>.from(
            json["result"].map((element) => ResultResponse.fromJson(element))),
        error: json["error"],
      );

  ChartEntity toEntity() {
    return ChartEntity(
      result: result.map((element) {
        return element.toEntity();
      }).toList(),
      error: error,
    );
  }
}
