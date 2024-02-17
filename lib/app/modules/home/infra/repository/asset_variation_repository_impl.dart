import 'package:dartz/dartz.dart';

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
}
