import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_event.dart';
import 'package:test_asset_variation/app/modules/home/presentation/bloc/home_state.dart';
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
        listener: (context, homeState) {
          if (homeState is FailureHomeState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: TextViewWidget(
                  label: 'Error: ${homeState.error}',
                  size: Sizes.x2,
                  color: ColorsPallete.redColor,
                ),
              ),
            );
            bloc.add(GetHomeAssetsEvent());
          }
          if (homeState is SuccessAssetVariationState) {
            Modular.to.pushNamed('/detail', arguments: homeState.data);
            bloc.add(GetHomeAssetsEvent());
          }
        },
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
            return ListView.builder(
              itemCount: homeState.data.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: Sizes.x2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    bloc.add(GetHomeAssetVariationEvent(asset: homeState.data[index].symbol));
                  },
                  child: Container(
                    height: 64,
                    width: double.infinity,
                    margin: const EdgeInsets.all(Sizes.x1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.x1),
                      border: Border.all(color: ColorsPallete.primaryColor)
                    ),
                    child: Center(
                      child: ListTile(
                        title: TextViewWidget(
                          label: homeState.data[index].symbol,
                          color: ColorsPallete.primaryColor,
                          size: Sizes.x2,
                        ),
                        trailing: TextViewWidget(
                          label: '${homeState.data[index].price}',
                          color: ColorsPallete.primaryColor,
                          size: Sizes.x2,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
