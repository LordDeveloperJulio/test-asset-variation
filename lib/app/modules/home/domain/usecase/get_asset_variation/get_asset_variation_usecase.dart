import 'package:dartz/dartz.dart';

import '../../domain.dart';

abstract class GetAssetVariationUseCase {
  Future<Either<Exception, List<AssetDetailEntity>>> call({required String asset});
}