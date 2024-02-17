import 'package:test_asset_variation/app/modules/home/domain/entities/trading_periods_entity.dart';

class CurrentTradingPeriodEntity {
  final TradingPeriodsEntity pre;
  final TradingPeriodsEntity regular;
  final TradingPeriodsEntity post;

  CurrentTradingPeriodEntity({
    required this.pre,
    required this.regular,
    required this.post,
  });
}
