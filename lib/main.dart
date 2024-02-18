import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_asset_variation/app/modules/shared/api_routes.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  CoreNetwork.init(
    baseUrl: ApiRoutes.baseUrl,
    isDebug: false,
  );
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}