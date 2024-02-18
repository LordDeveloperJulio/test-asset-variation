import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  CoreNetwork.init(
    baseUrl: 'https://financialmodelingprep.com/',
    isDebug: false,
  );
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}