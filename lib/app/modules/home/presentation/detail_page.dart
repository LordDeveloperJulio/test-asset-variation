import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_asset_variation/app/modules/shared/utils/colors_pallete.dart';
import 'package:test_asset_variation/app/modules/shared/widgets/text_view_widget.dart';

import '../../shared/utils/sizes.dart';
import '../domain/domain.dart';

class DetailPage extends StatefulWidget {
  final List<AssetDetailEntity> list;

  const DetailPage({super.key, required this.list});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List<ChartDataEntity> data = [];
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    createList();
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
        enablePinching: true
    );
    super.initState();
  }

  void createList() {
    for (int i = 0; i < widget.list.length; i++) {
      data.add(
        ChartDataEntity(
          x: DateTime.fromMicrosecondsSinceEpoch(widget.list[i].timeStamp!),
          high: widget.list[i].high ?? 0,
          low: widget.list[i].low ?? 0,
          open: widget.list[i].open ?? 0,
          close: widget.list[i].close ?? 0,
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
      body: SfCartesianChart(
          primaryXAxis: const DateTimeAxis(),
          zoomPanBehavior: _zoomPanBehavior,
          series: <CartesianSeries>[
            // Renders CandleSeries
            CandleSeries<ChartDataEntity, DateTime>(
              dataSource: data,
              xValueMapper: (ChartDataEntity data, _) => data.x,
              lowValueMapper: (ChartDataEntity data, _) => data.low,
              highValueMapper: (ChartDataEntity data, _) => data.high,
              openValueMapper: (ChartDataEntity data, _) => data.open,
              closeValueMapper: (ChartDataEntity data, _) => data.close,

            )
          ]
      ),
    );
  }
}

class ChartDataEntity {
  final DateTime x;
  final double high;
  final double low;
  final double open;
  final double close;

  ChartDataEntity({
    required this.x,
    required this.high,
    required this.low,
    required this.open,
    required this.close,
  });
}
