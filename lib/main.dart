import 'package:flutter/material.dart';
import 'package:test_asset_variation/app/modules/shared/utils/colors_pallete.dart';

import 'app/modules/home/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test - Asset Variation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsPallete.primaryColor),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
