import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class AssetDetailRemoteDataSource {
  Future<Either<HttpExceptions,  List<dynamic>>> getAssetDetail({required String asset});
}