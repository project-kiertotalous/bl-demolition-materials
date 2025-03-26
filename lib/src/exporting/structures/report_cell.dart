import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'styles/exports.dart';

part 'report_cell.freezed.dart';

@freezed
abstract class ReportCell with _$ReportCell {
  ReportCell._();

  factory ReportCell(
      {@Default('') dynamic value,
      @Default(11) double fontSize,
      @Default('Calibri') String fontFamily,
      @Default(true) bool wrapText,
      @Default(TextStyle.regular) TextStyle textStyle,
      @Default(TextHorizontalAlign.left) TextHorizontalAlign horizontalAlign,
      @Default(TextVerticalAlign.bottom)
      TextVerticalAlign verticalAlign}) = _ReportCell;

  CellValue get valueAsExcelValue {
    if (value is int) {
      return IntCellValue(value);
    } else if (value is double) {
      return DoubleCellValue(value);
    }

    return TextCellValue(value == null ? '' : value.toString());
  }

  String get valueString {
    if (value == null) {
      return '';
    } else if (value is int) {
      return value.toString();
    } else if (value is double) {
      return value.toStringAsFixed(2);
    }

    return value.toString();
  }

  NumFormat get excelFormat {
    if (value is num) {
      return NumFormat.standard_2;
    }

    return NumFormat.standard_0;
  }
}
