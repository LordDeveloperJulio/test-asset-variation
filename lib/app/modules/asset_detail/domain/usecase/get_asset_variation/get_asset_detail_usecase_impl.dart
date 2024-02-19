import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../infra/repository/asset_detail_repository.dart';
import '../../domain.dart';

class GetAssetDetailUseCaseImpl implements GetAssetDetailUseCase {
  final AssetDetailRepository repository;

  GetAssetDetailUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, List<AssetDetailEntity>>> call({required String asset}) async {
    return repository.getAssetDetail(asset: asset);
  }
}
