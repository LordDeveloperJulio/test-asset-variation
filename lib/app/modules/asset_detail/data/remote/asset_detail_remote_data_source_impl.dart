import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/api_routes.dart';
import 'asset_detail_remote_data_source.dart';

class AssetDetailRemoteDataSourceImpl
    implements AssetDetailRemoteDataSource {
  final NetworkClient networkClient;

  AssetDetailRemoteDataSourceImpl({
    required this.networkClient,
  });

  @override
  Future<Either<HttpExceptions, List<dynamic>>> getAssetDetail(
      {required String asset}) async {
    try {
      final result =
          await networkClient.get(ApiRoutes.getAssetVariation + asset);
      return Right(result.data);
    } on HttpExceptions catch (error) {
      return Left(error);
    }
  }
}
