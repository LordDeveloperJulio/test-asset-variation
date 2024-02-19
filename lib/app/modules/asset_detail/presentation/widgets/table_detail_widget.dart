import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/utils/sizes.dart';
import '../../domain/entities/asset_detail_entity.dart';

class TableDetailWidget extends StatefulWidget {
  final List<AssetDetailEntity> list;
  const TableDetailWidget({super.key, required this.list});

  @override
  State<TableDetailWidget> createState() => _TableDetailWidgetState();
}

class _TableDetailWidgetState extends State<TableDetailWidget> {
  String returnDate(int? dateParam) {
    int timestampMicroseconds = dateParam! * 1000000;
    DateTime dateTimeFromMicroseconds = DateTime.fromMicrosecondsSinceEpoch(timestampMicroseconds);
    return DateFormat('dd/MM/yyyy').format(dateTimeFromMicroseconds);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    Text(returnDate(element.timeStamp))),
                DataCell(Text('${element.open}')),
                DataCell(Text('${element.close}')),
                DataCell(Text('${element.high}')),
                DataCell(Text('${element.low}')),
                DataCell(Text('${element.percentageVariation} %')),
                DataCell(Text(
                    '${element.percentageChangeSinceFirstTradingDay} %')),
              ],
            )),
          )
              .toList(),
        ),
      ),
    );
  }
}
