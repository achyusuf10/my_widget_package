import 'package:flutter/material.dart';

class TableCellModel {
  String typeContent;
  String text;
  TextStyle? cellTextStyle;
  Widget widget;

  /// Note : Ini buat kalau cellnya mau bentuk text

  TableCellModel.text({
    required this.text,
    this.cellTextStyle,
  })  : typeContent = 'text',
        widget = const SizedBox();

  /// Note : Ini buat kalau cellnya mau bentuk widget bukan text
  TableCellModel.widget({
    required this.widget,
  })  : cellTextStyle = null,
        typeContent = 'widget',
        text = '';
}
