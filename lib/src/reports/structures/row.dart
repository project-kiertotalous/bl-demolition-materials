import 'package:bl_demolition_materials/src/reports/structures/styles/exports.dart';
import 'package:bl_demolition_materials/src/reports/structures/styles/line_style.dart';
import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'row.freezed.dart';

@freezed
abstract class Row with _$Row {
  const factory Row(
      {@Default(RowStyles.styleSolidBorders) List<LineStyle> borderStyle,
        double? height,
      required List<Cell> cells}) = _Row;
}
