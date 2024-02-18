import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

abstract class GetAssetsUseCase {
  Future<Either<Exception, List<AssetEntity>>> call();
}