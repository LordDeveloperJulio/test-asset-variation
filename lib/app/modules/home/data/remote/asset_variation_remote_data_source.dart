import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class AssetVariationRemoteDataSource {
  Future<Either<HttpExceptions,  List<dynamic>>> getAssetVariation({required String asset});
  Future<Either<HttpExceptions, List<dynamic>>> getAssets();
}