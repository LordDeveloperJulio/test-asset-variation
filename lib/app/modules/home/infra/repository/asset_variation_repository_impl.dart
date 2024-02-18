import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/infra/mappers/asset_response.dart';

import '../../data/remote/asset_variation_remote_data_source.dart';
import '../../domain/domain.dart';
import '../mappers/asset_detail_response.dart';
import 'asset_variation_repository.dart';

class AssetVariationRepositoryImpl implements AssetVariationRepository {
  final AssetVariationRemoteDataSource dataSource;

  AssetVariationRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Exception, List<AssetDetailEntity>>> getAssetVariation(
      {required String asset}) async {
    final result = await dataSource.getAssetVariation(asset: asset);
    return result.fold(
      (Exception exception) {
        return left(exception);
      },
          (List<dynamic> list) {
        try {
          List<AssetDetailEntity> listAssets = [];
          for (int i = 0; i < list.length; i++) {
            listAssets.add(AssetDetailResponse.fromJson(list[i]).toEntity());
          }
          return right(listAssets);
        } catch (e) {
          return left(Exception(e));
        }
      },
    );
  }

  @override
  Future<Either<Exception, List<AssetEntity>>> getAssets() async {
    final result = await dataSource.getAssets();
    return result.fold(
      (Exception exception) {
        print(exception.toString());
        return left(exception);
      },
      (List<dynamic> list) {
        try {
          List<AssetEntity> listAssets = [];
          for (int i = 0; i < 1000; i++) {
            listAssets.add(AssetResponse.fromJson(list[i]).toEntity());
          }
          return right(listAssets);
        } catch (e) {
          return left(Exception(e));
        }
      },
    );
  }
}
