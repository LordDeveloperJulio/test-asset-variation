import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../infra/repository/asset_variation_repository.dart';
import '../../entities/asset_entity.dart';
import 'get_asset_usecase.dart';

class GetAssetsUseCaseImpl implements GetAssetsUseCase {
  final AssetVariationRepository repository;

  GetAssetsUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, List<AssetEntity>>> call() async {
    return repository.getAssets();
  }
}
