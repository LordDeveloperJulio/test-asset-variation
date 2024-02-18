import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_asset_variation/app/modules/home/domain/domain.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_event.dart';
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
  final HomeBloc bloc = Modular.get<HomeBloc>();
  String? title;

  @override
  void initState() {
    super.initState();
    bloc.add(GetHomeAssetsEvent());
  }

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
        listener: (context, homeState) {},
        bloc: bloc,
        builder: (context, homeState) {
          if (homeState is LoadingAssetsState) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsPallete.primaryColor,
              ),
            );
          }
          if (homeState is SuccessAssetsState) {
            return DropdownWidget(
              listAsset: homeState.data,
              title: title,
              onChanged: (value) {
                title = value;
                setState(() {
                  title = value;
                });
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
