import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../shared/api_routes.dart';
import 'asset_variation_remote_data_source.dart';

class AssetVariationRemoteDataSourceImpl
    implements AssetVariationRemoteDataSource {
  final Dio networkClient;

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
}
