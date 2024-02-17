import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_state.dart';
import 'package:test_asset_variation/app/modules/home/presentation/widgets/dropdown_widget.dart';
import 'package:test_asset_variation/app/modules/shared/utils/colors_pallete.dart';

import '../../shared/utils/sizes.dart';
import '../../shared/widgets/text_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();
  String? title;

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
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        bloc: bloc,
        builder: (context, state) {
          return DropdownWidget(
            listAsset: [
              AssetEntity(
                symbol: 'FEMACX',
                name:
                    'The First Trust Combined Series 447: Investment Grade Multi-Asset Income Portfolio, Long Term, Series 12',
                price: 956.16,
                exchange: 'NASDAQ',
                exchangeShortName: 'NASDAQ',
                type: 'trust',
              ),
              AssetEntity(
                symbol: 'KALYANIFRG.NS',
                name: 'Kalyani Forge Limited',
                price: 406.65,
                exchange: 'National Stock Exchange of India',
                exchangeShortName: 'NSE',
                type: 'stock',
              ),
            ],
            title: title,
            onChanged: (value) {
              title = value;
              setState(() {
                title = value;
              });
            },
          );
        },
      ),
    );
  }
}
