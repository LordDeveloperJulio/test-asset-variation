import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_asset_variation/app/modules/asset_detail/presentation/bloc/asset_detail_bloc.dart';
import 'package:test_asset_variation/app/modules/asset_detail/presentation/bloc/asset_detail_event.dart';
import 'package:test_asset_variation/app/modules/shared/utils/colors_pallete.dart';
import 'package:test_asset_variation/app/modules/shared/widgets/text_view_widget.dart';

import '../../shared/utils/sizes.dart';
import '../domain/domain.dart';
import 'bloc/asset_detail_state.dart';
import 'widgets/table_detail_widget.dart';

class DetailPage extends StatefulWidget {
  final String asset;
  const DetailPage({super.key, required this.asset});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final AssetDetailBloc bloc = Modular.get<AssetDetailBloc>();

  late List<ChartDataEntity> data = [];
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = ZoomPanBehavior(enablePinching: true);
    bloc.add(GetAssetDetailEvent(asset: widget.asset));
  }

  void createList(SuccessAssetDetailState state) {
    for (int i = 0; i < state.data.length; i++) {
      data.add(
        ChartDataEntity(
          x: DateTime.fromMillisecondsSinceEpoch(state.data[i].timeStamp!),
          high: state.data[i].high ?? 0,
          low: state.data[i].low ?? 0,
          open: state.data[i].open ?? 0,
          close: state.data[i].close ?? 0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsPallete.primaryColor,
        leading: InkWell(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const TextViewWidget(
          label: 'Detail',
          size: Sizes.x3,
          color: ColorsPallete.backgroundColor,
        ),
      ),
      backgroundColor: ColorsPallete.backgroundColor,
      body: BlocConsumer<AssetDetailBloc, AssetDetailState>(
        listener: (context, state) {
          if (state is FailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: TextViewWidget(
                  label: 'Error: ${state.error}',
                  size: Sizes.x2,
                  color: ColorsPallete.redColor,
                ),
              ),
            );
            Modular.to.pop();
          }
        },
        bloc: bloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsPallete.primaryColor,
              ),
            );
          }
          if (state is SuccessAssetDetailState) {
            createList(state);
            return Column(
              children: [
                SfCartesianChart(
                  primaryXAxis: const DateTimeAxis(),
                  zoomPanBehavior: _zoomPanBehavior,
                  series: <CartesianSeries>[
                    CandleSeries<ChartDataEntity, DateTime>(
                      dataSource: data,
                      xValueMapper: (ChartDataEntity data, _) => data.x,
                      lowValueMapper: (ChartDataEntity data, _) => data.low,
                      highValueMapper: (ChartDataEntity data, _) => data.high,
                      openValueMapper: (ChartDataEntity data, _) => data.open,
                      closeValueMapper: (ChartDataEntity data, _) => data.close,
                    )
                  ],
                ),
                TableDetailWidget(list: state.data),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
