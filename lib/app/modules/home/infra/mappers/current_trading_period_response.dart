import 'package:test_asset_variation/app/modules/home/infra/mappers/trading_periods_response.dart';

import '../../domain/entities/current_trading_period_entity.dart';

class CurrentTradingPeriodResponse {
  final TradingPeriodsResponse pre;
  final TradingPeriodsResponse regular;
  final TradingPeriodsResponse post;

  CurrentTradingPeriodResponse({
    required this.pre,
    required this.regular,
    required this.post,
  });

  factory CurrentTradingPeriodResponse.fromJson(Map<String, dynamic> json) =>
      CurrentTradingPeriodResponse(
        pre: TradingPeriodsResponse.fromJson(json["pre"]),
        regular: TradingPeriodsResponse.fromJson(json["regular"]),
        post: TradingPeriodsResponse.fromJson(json["post"]),
      );

  CurrentTradingPeriodEntity toEntity() {
    return CurrentTradingPeriodEntity(
      pre: pre.toEntity(),
      regular: regular.toEntity(),
      post: post.toEntity(),
    );
  }
}
