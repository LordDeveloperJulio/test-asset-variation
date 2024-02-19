import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/infra/mappers/asset_response.dart';

import '../../../shared/exceptions/exceptions.dart';
import '../../data/remote/asset_variation_remote_data_source.dart';
import '../../domain/domain.dart';
import 'asset_variation_repository.dart';

class AssetVariationRepositoryImpl implements AssetVariationRepository {
  final AssetVariationRemoteDataSource dataSource;

  AssetVariationRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<NetworkExceptions, List<AssetEntity>>> getAssets() async {
    final result = await dataSource.getAssets();
    return result.fold(
      (HttpExceptions exception) {
        return left(verifyException(
            statusCode: exception.statusCode, data: exception.data));
      },
      (List<dynamic> list) {
        try {
          List<AssetEntity> listAssets = [];
          for (int i = 0; i < 1000; i++) {
            listAssets.add(AssetResponse.fromJson(list[i]).toEntity());
          }
          return right(listAssets);
        } catch (e) {
          return left(NetworkUnknownException());
        }
      },
    );
  }
}
