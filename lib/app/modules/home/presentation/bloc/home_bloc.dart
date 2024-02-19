import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

import '../../../shared/exceptions/exceptions.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
      {required this.getAssetVariationUseCase, required this.getAssetsUseCase})
      : super(InitialHomeState()) {
    on<GetHomeAssetVariationEvent>(getAssetVariation);
    on<GetHomeAssetsEvent>(getAssets);
  }

  final GetAssetVariationUseCase getAssetVariationUseCase;
  final GetAssetsUseCase getAssetsUseCase;

  Future<void> getAssetVariation(
    GetHomeAssetVariationEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingAssetsState());
    Either<NetworkExceptions, List<AssetDetailEntity>> response =
        await getAssetVariationUseCase.call(asset: event.asset);
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureHomeState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessAssetVariationState(data: r)),
    );
  }

  Future<void> getAssets(
    GetHomeAssetsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingAssetsState());
    Either<NetworkExceptions, List<AssetEntity>> response =
        await getAssetsUseCase.call();
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureHomeState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessAssetsState(data: r)),
    );
  }
}
