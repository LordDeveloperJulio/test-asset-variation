import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/api_routes.dart';
import 'asset_variation_remote_data_source.dart';

class AssetVariationRemoteDataSourceImpl
    implements AssetVariationRemoteDataSource {
  final NetworkClient networkClient;

  AssetVariationRemoteDataSourceImpl({
    required this.networkClient,
  });

  @override
  Future<Either<HttpExceptions, List<dynamic>>> getAssetVariation(
      {required String asset}) async {
    try {
      final result =
          await networkClient.get(ApiRoutes.getAssetVariation + asset);
      return Right(result.data);
    } on HttpExceptions catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<HttpExceptions, List<dynamic>>> getAssets() async {
    try {
      final result = await networkClient.get(ApiRoutes.getAssets);

      return Right(result.data);
    } on HttpExceptions catch (error) {
      return Left(error);
    }
  }
}
