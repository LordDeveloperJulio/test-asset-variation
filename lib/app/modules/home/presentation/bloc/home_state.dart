import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadingAssetsState extends HomeState {}

class SuccessAssetsState extends HomeState {
  final List<AssetEntity> data;

  SuccessAssetsState({required this.data});
}

class FailureHomeState extends HomeState {
  String error;

  FailureHomeState({required this.error});
}
