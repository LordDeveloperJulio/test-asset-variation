import 'package:flutter_modular/flutter_modular.dart';

import 'modules/asset_detail/asset_detail_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/detail', module: AssetDetailModule());
  }
}
