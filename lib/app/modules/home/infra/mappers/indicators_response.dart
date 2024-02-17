import 'package:test_asset_variation/app/modules/home/infra/mappers/quote_response.dart';

import '../../domain/entities/indicators_entity.dart';

class IndicatorsResponse {
  final List<QuoteResponse> quote;

  IndicatorsResponse({required this.quote});

  factory IndicatorsResponse.fromJson(Map<String, dynamic> json) =>
      IndicatorsResponse(
        quote: List<QuoteResponse>.from(
            json["quote"].map((element) => QuoteResponse.fromJson(element))),
      );

  IndicatorsEntity toEntity() {
    return IndicatorsEntity(
      quote: quote.map((element) {
        return element.toEntity();
      }).toList(),
    );
  }
}
