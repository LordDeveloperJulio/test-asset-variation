abstract class HomeEvent {}

class InitialHomeEvent extends HomeEvent {}

class GetHomeAssetVariationEvent extends HomeEvent {
  final String asset;

  GetHomeAssetVariationEvent({required this.asset});
}

class GetHomeAssetsEvent extends HomeEvent {}
