import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

abstract class AssetVariationRepository {
  Future<Either<Exception, ChartEntity>> getAssetVariation();
}
