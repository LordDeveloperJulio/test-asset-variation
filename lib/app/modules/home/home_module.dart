import 'package:core_network/core_network.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:test_asset_variation/app/modules/home/presentation/home_page.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'infra/infra.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    //BLOC
    i.add(
      () => HomeBloc(
        getAssetVariationUseCase: Modular.get<GetAssetVariationUseCase>(),
        getAssetsUseCase: Modular.get<GetAssetsUseCase>(),
      ),
    );
    //USECASE
    i.add<GetAssetVariationUseCase>(
      () => GetAssetVariationUseCaseImpl(
          repository: Modular.get<AssetVariationRepository>()),
    );
    i.add<GetAssetsUseCase>(
          () => GetAssetsUseCaseImpl(
          repository: Modular.get<AssetVariationRepository>()),
    );
    //REPOSITORY
    i.add<AssetVariationRepository>(
      () => AssetVariationRepositoryImpl(
          dataSource: Modular.get<AssetVariationRemoteDataSource>()),
    );
    //DATASOURCE
    i.add<AssetVariationRemoteDataSource>(
      () => AssetVariationRemoteDataSourceImpl(
          networkClient: CoreNetwork.instance),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
