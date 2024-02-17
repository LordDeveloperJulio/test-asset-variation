import 'package:dartz/dartz.dart';

import '../../entities/chart_entity.dart';

abstract class GetAssetVariationUseCase {
  Future<Either<Exception, ChartEntity>> call();
}