import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../domain.dart';

abstract class GetAssetDetailUseCase {
  Future<Either<NetworkExceptions, List<AssetDetailEntity>>> call({required String asset});
}