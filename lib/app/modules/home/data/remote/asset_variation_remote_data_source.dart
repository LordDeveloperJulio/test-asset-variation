import 'package:dartz/dartz.dart';

abstract class AssetVariationRemoteDataSource {
  Future<Either<Exception,  List<dynamic>>> getAssetVariation({required String asset});
  Future<Either<Exception, List<dynamic>>> getAssets();
}