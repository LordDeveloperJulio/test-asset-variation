import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

import '../../domain/entities/asset_detail_entity.dart';

class AssetDetailState {}

class InitialState extends AssetDetailState {}

class LoadingState extends AssetDetailState {}

class SuccessAssetDetailState extends AssetDetailState {
  final List<AssetDetailEntity> data;

  SuccessAssetDetailState({required this.data});
}

class SuccessAssetsState extends AssetDetailState {
  final List<AssetEntity> data;

  SuccessAssetsState({required this.data});
}

class FailureState extends AssetDetailState {
  String error;

  FailureState({required this.error});
}
