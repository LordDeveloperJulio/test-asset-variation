abstract class AssetDetailEvent {}

class InitialEvent extends AssetDetailEvent {}

class GetAssetDetailEvent extends AssetDetailEvent {
  final String asset;

  GetAssetDetailEvent({required this.asset});
}

class GetAssetsEvent extends AssetDetailEvent {}
