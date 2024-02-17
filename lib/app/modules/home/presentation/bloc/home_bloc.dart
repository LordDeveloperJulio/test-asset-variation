import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getAssetVariationUseCase})
      : super(InitialHomeState()) {
    on<GetHomeAssetVariationEvent>(getAssetVariation);
  }

  final GetAssetVariationUseCase getAssetVariationUseCase;

  Future<void> getAssetVariation(
    GetHomeAssetVariationEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingHomeState());
    Either<Exception, ChartEntity> response =
        await getAssetVariationUseCase.call();
    response.fold(
      (l) => emit(FailureHomeState(error: l.toString())),
      (r) => emit(SuccessHomeState(data: r)),
    );
  }
}
