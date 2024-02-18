import 'package:core_network/api/network_client.dart';
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
  Future<Either<Exception, Map<String, dynamic>>> getAssetVariation() async {
    try {
      final result = await networkClient.get(ApiRoutes.getAssetVariation);
      return Right(result.data);
    } catch (error) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, List<dynamic>>> getAssets() async {
    try {
      final result = await networkClient.get(ApiRoutes.getAssets);

      return Right(result.data);
    } catch (error) {
      return Left(Exception());
    }
  }
}
