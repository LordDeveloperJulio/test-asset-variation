import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

import '../../../shared/exceptions/exceptions.dart';

abstract class AssetVariationRepository {
  Future<Either<NetworkExceptions, List<AssetEntity>>> getAssets();
}
