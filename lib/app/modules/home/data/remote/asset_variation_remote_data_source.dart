import 'package:dartz/dartz.dart';

abstract class AssetVariationRemoteDataSource {
  Future<Either<Exception, Map<String, dynamic>>> getAssetVariation();
}