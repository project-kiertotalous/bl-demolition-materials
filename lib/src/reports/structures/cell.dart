import 'package:bl_demolition_materials/src/reports/structures/styles/text_align.dart';
import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'styles/exports.dart';

part 'cell.freezed.dart';

@freezed
abstract class Cell with _$Cell {
  Cell._();

  factory Cell(
      {@Default('') dynamic value,
      @Default(11) int fontSize,
      @Default('Calibri') String fontFamily,
      @Default(true) bool wrapText,
      @Default(TextStyle.regular) TextStyle textStyle,
      @Default(TextHorizontalAlign.left) TextHorizontalAlign horizontalAlign,
      @Default(TextVerticalAlign.bottom)
      TextVerticalAlign verticalAlign}) = _Cell;

  CellValue get valueAsExcelValue {
    if (value is int) {
      return IntCellValue(value);
    } else if (value is double) {
      return DoubleCellValue(value);
    }

    return TextCellValue(value == null ? '' : value.toString());
  }

  NumFormat get excelFormat {
    if (value is num) {
      return NumFormat.standard_2;
    }

    return NumFormat.standard_0;
  }
}
