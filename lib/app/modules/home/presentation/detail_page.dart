import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
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
    _zoomPanBehavior = ZoomPanBehavior(enablePinching: true);
    super.initState();
  }

  void createList() {
    for (int i = 0; i < widget.list.length; i++) {
      data.add(
        ChartDataEntity(
          x: DateTime.fromMillisecondsSinceEpoch(widget.list[i].timeStamp!),
          high: widget.list[i].high ?? 0,
          low: widget.list[i].low ?? 0,
          open: widget.list[i].open ?? 0,
          close: widget.list[i].close ?? 0,
        ),
      );
    }
  }

  String returnDate(int? dateParam) {
    int timestampMicroseconds = dateParam! * 1000000;
    DateTime dateTimeFromMicroseconds = DateTime.fromMicrosecondsSinceEpoch(timestampMicroseconds);
    return DateFormat('dd/MM/yyyy').format(dateTimeFromMicroseconds);
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
      body: Column(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.x2),
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn2(
                    label: Text('Date'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Open'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('Close'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('High'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('Low'),
                    numeric: true,
                  ),
                  DataColumn2(
                    label: Text('Day Variation'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('First Trading'),
                    size: ColumnSize.L,
                  ),
                ],
                rows: widget.list
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                  Text(returnDate(element.timeStamp) ?? '')),
                              DataCell(Text('${element.open}')),
                              DataCell(Text('${element.close}')),
                              DataCell(Text('${element.high}')),
                              DataCell(Text('${element.low}')),
                              DataCell(Text('% ${element.percentageVariation}')),
                              DataCell(Text(
                                  '% ${element.percentageChangeSinceFirstTradingDay}')),
                            ],
                          )),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
