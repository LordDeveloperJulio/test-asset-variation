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
  Future<Either<Exception, List<dynamic>>> getAssetVariation(
      {required String asset}) async {
    try {
      final result =
          await networkClient.get('https://run.mocky.io/v3/1b4f5239-a1d4-4d81-9a9f-088f7df4a895');
      return Right(result.data);
    } catch (error) {
      return Left(Exception(error));
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
