import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:my_widget_package/data/model/table_cell_model.dart';

class GenerateTableWidget extends StatelessWidget {
  final List<TableColumnWidth> tableColumnWidth;

  /// Tambahkan "No" untuk menambahkan nomor
  final List<String> headers;
  final List<List<TableCellModel>> cells;
  final TableBorder? tableBorder;
  final TextStyle? headerStyle;
  final EdgeInsets? paddingCell;

  /// Default TableCellVerticalAlignment.middle
  final TableCellVerticalAlignment? defaultVerticalAlignment;
  const GenerateTableWidget({
    super.key,
    required this.tableColumnWidth,
    required this.headers,
    required this.cells,
    this.tableBorder,
    this.defaultVerticalAlignment,
    this.headerStyle,
    this.paddingCell,
  });
  @override
  Widget build(BuildContext context) {
    Map<int, TableColumnWidth> generateTableColumnWidth() {
      var result = <int, TableColumnWidth>{};
      int index = 0;
      for (var data in tableColumnWidth) {
        result.putIfAbsent(index, () => data);
        index++;
      }
      return result;
    }

    return Table(
      columnWidths: generateTableColumnWidth(),
      defaultVerticalAlignment:
          defaultVerticalAlignment ?? TableCellVerticalAlignment.middle,
      border: tableBorder ?? TableBorder.all(color: Colors.grey),
      children: [
        getMyColumns(headers),
        ...getMyRows(cells, context),
      ],
    );
  }

  TableRow getMyColumns(List<String> columns) => TableRow(
      children: columns
          .map(
            (item) => TableCell(
              child: Padding(
                padding: paddingCell ??
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                child: Text(
                  item,
                  style: headerStyle,
                  textAlign: (item == 'No') ? TextAlign.center : TextAlign.left,
                ),
              ),
            ),
          )
          .toList());

  List<TableRow> getMyRows(
    List<List<TableCellModel>> dataCells,
    BuildContext context,
  ) {
    int index = 1;

    return dataCells.map(
      (dataPerCell) {
        final number = index;

        List<Widget> listChildTableRow = [];
        if (headers.contains('No')) {
          listChildTableRow.add(
            Text(
              number.toString(),
              style: headerStyle,
              textAlign: TextAlign.center,
            ),
          );
        }

        /// Generate Table Cell yang akan ditampilkan Per Row
        for (var data in dataPerCell) {
          Widget generateWidget = ConditionalSwitch.single(
            context: context,
            valueBuilder: (context) => data.typeContent,
            caseBuilders: {
              'widget': (context) => data.widget,
              'text': (context) => Text(
                    data.text,
                    style: data.cellTextStyle,
                    textAlign: TextAlign.left,
                  ),
            },
            fallbackBuilder: (context) => const SizedBox(),
          );
          listChildTableRow.add(generateWidget);
        }
        index++;

        /// Menjadikan Table Cell ke 1 Table Row
        return TableRow(
          children: listChildTableRow
              .map(
                (e) => TableCell(
                  child: Padding(
                    padding: paddingCell ??
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    child: e,
                  ),
                ),
              )
              .toList(),
        );
      },
    ).toList();
  }
}
