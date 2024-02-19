import 'package:core_network/core_network.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_asset_variation/app/modules/asset_detail/presentation/bloc/asset_detail_bloc.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'infra/infra.dart';
import 'presentation/detail_page.dart';

class AssetDetailModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    //BLOC
    i.add(
      () => AssetDetailBloc(
          getAssetDetailUseCase: Modular.get<GetAssetDetailUseCase>()),
    );
    //USECASE
    i.add<GetAssetDetailUseCase>(
      () => GetAssetDetailUseCaseImpl(
          repository: Modular.get<AssetDetailRepository>()),
    );
    //REPOSITORY
    i.add<AssetDetailRepository>(
      () => AssetDetailRepositoryImpl(
          dataSource: Modular.get<AssetDetailRemoteDataSource>()),
    );
    //DATASOURCE
    i.add<AssetDetailRemoteDataSource>(
      () =>
          AssetDetailRemoteDataSourceImpl(networkClient: CoreNetwork.instance),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => DetailPage(asset: r.args.data));
  }
}
