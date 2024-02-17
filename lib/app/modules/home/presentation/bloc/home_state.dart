import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final ChartEntity data;

  SuccessHomeState({required this.data});
}

class FailureHomeState extends HomeState {
  String error;

  FailureHomeState({required this.error});
}
