import 'package:dartz/dartz.dart';

import '../../../shared/exceptions/exceptions.dart';
import '../../domain/entities/asset_detail_entity.dart';

abstract class AssetDetailRepository {
  Future<Either<NetworkExceptions, List<AssetDetailEntity>>> getAssetDetail({required String asset});
}
