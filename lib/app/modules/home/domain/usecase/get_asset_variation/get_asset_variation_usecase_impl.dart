import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../infra/repository/asset_variation_repository.dart';
import '../../domain.dart';

class GetAssetVariationUseCaseImpl implements GetAssetVariationUseCase {
  final AssetVariationRepository repository;

  GetAssetVariationUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, List<AssetDetailEntity>>> call({required String asset}) async {
    return repository.getAssetVariation(asset: asset);
  }
}
