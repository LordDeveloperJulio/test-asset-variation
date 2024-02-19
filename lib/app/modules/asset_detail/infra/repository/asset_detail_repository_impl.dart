import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/exceptions/exceptions.dart';
import '../../data/remote/asset_detail_remote_data_source.dart';
import '../../domain/domain.dart';
import '../mappers/asset_detail_response.dart';
import 'asset_detail_repository.dart';

class AssetDetailRepositoryImpl implements AssetDetailRepository {
  final AssetDetailRemoteDataSource dataSource;

  AssetDetailRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<NetworkExceptions, List<AssetDetailEntity>>> getAssetDetail(
      {required String asset}) async {
    final result = await dataSource.getAssetDetail(asset: asset);
    return result.fold(
      (HttpExceptions exception) {
        return left(verifyException(
            statusCode: exception.statusCode, data: exception.data));
      },
      (List<dynamic> list) {
        try {
          List<AssetDetailEntity> listAssets = [];
          for (int i = 0; i < list.length; i++) {
            listAssets.add(AssetDetailResponse.fromJson(list[i]).toEntity());
          }
          return right(listAssets);
        } catch (e) {
          return left(NetworkUnknownException());
        }
      },
    );
  }
}
