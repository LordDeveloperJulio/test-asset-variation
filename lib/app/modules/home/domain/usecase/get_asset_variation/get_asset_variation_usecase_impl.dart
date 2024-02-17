import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/entities/chart_entity.dart';

import '../../../infra/repository/asset_variation_repository.dart';
import 'get_asset_variation_usecase.dart';

class GetAssetVariationUseCaseImpl implements GetAssetVariationUseCase {
  final AssetVariationRepository repository;

  GetAssetVariationUseCaseImpl({required this.repository});

  Future<Either<Exception, ChartEntity>> call() async {
    return repository.getAssetVariation();
  }
}
