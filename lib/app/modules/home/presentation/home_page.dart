import 'package:flutter/material.dart';
import 'package:test_asset_variation/app/modules/shared/utils/colors_pallete.dart';

import '../../shared/utils/sizes.dart';
import '../../shared/widgets/text_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsPallete.primaryColor,
        title: const TextViewWidget(
          label: 'Home',
          size: Sizes.x3,
          color: ColorsPallete.backgroundColor,
        ),
      ),
      backgroundColor: ColorsPallete.backgroundColor,
    );
  }
}
