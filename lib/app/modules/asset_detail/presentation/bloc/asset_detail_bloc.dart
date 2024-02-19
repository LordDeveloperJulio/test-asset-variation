import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/exceptions/exceptions.dart';
import '../../domain/domain.dart';
import 'asset_detail_event.dart';
import 'asset_detail_state.dart';

class AssetDetailBloc extends Bloc<AssetDetailEvent, AssetDetailState> {
  AssetDetailBloc({required this.getAssetDetailUseCase})
      : super(InitialState()) {
    on<GetAssetDetailEvent>(getAssetDetail);
  }

  final GetAssetDetailUseCase getAssetDetailUseCase;

  List<ChartDataEntity> data = [];

  Future<void> getAssetDetail(
    GetAssetDetailEvent event,
    Emitter<AssetDetailState> emit,
  ) async {
    emit(LoadingState());
    Either<NetworkExceptions, List<AssetDetailEntity>> response =
        await getAssetDetailUseCase.call(asset: event.asset);
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureState(
        error: networkExceptions.message!,
      )),
      (List<AssetDetailEntity> list) => emit(
        SuccessAssetDetailState(data: list),
      ),
    );
  }
}
