import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getAssetVariationUseCase, required this.getAssetsUseCase})
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
    emit(LoadingHomeState());
    Either<Exception, ChartEntity> response =
        await getAssetVariationUseCase.call();
    response.fold(
      (l) => emit(FailureHomeState(error: l.toString())),
      (r) => emit(SuccessAssetVariationState(data: r)),
    );
  }

  Future<void> getAssets(
    GetHomeAssetsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingAssetsState());
    Either<Exception, List<AssetEntity>> response = await getAssetsUseCase.call();
    response.fold(
      (l) => emit(FailureHomeState(error: l.toString())),
      (r) => emit(SuccessAssetsState(data: r)),
    );
  }
}
