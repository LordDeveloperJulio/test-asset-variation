import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
    data = [
      _ChartData('CHN', 38, 10, 21, 29),
      _ChartData('GER', 32, 12, 19, 30),
      _ChartData('RUS', 37, 7, 17, 24),
      _ChartData('BRZ', 34, 9, 16, 27),
      _ChartData('IND', 35, 13, 18, 31)
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

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
            return Column(
              children: [
                DropdownWidget(
                  listAsset: homeState.data,
                  title: title,
                  onChanged: (value) {
                    title = value;
                    setState(() {
                      title = value;
                    });
                  },
                ),
                SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis:
                      const NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                    CandleSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      highValueMapper: (_ChartData data, _) => data.high,
                      lowValueMapper: (_ChartData data, _) => data.low,
                      openValueMapper: (_ChartData data, _) => data.open,
                      closeValueMapper: (_ChartData data, _) => data.close,
                      name: 'Gold',
                    ),
                  ],
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);

  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
}
