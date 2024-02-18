import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/entities/asset_entity.dart';
import 'package:test_asset_variation/app/modules/home/infra/mappers/asset_response.dart';

import '../../data/remote/asset_variation_remote_data_source.dart';
import '../../domain/entities/chart_entity.dart';
import '../mappers/chart_response.dart';
import 'asset_variation_repository.dart';

class AssetVariationRepositoryImpl implements AssetVariationRepository {
  final AssetVariationRemoteDataSource dataSource;

  AssetVariationRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Exception, ChartEntity>> getAssetVariation() async {
    final result = await dataSource.getAssetVariation();
    return result.fold(
      (Exception exception) {
        return left(exception);
      },
      (Map<String, dynamic> map) {
        try {
          return right(ChartResponse.fromJson(map).toEntity());
        } catch (e) {
          return left(Exception());
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
      (List<dynamic> map) {
        try {
          List<AssetEntity> list = [];
          for(int i = 0; i < map.length; i++){
            list.add(AssetResponse.fromJson(map[i]).toEntity());
          }
          return right(list);
        } catch (e) {
          return left(Exception(e));
        }
      },
    );
  }
}
