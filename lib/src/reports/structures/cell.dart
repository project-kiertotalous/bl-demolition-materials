import 'package:bl_demolition_materials/src/reports/structures/styles/text_align.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'styles/exports.dart';

part 'cell.freezed.dart';

@freezed
abstract class Cell with _$Cell {
  const factory Cell(
      {@Default('') String text,
      @Default(11) int fontSize,
      @Default('Calibri') String fontFamily,
      @Default(true) bool wrapText,
      @Default(TextStyle.regular) TextStyle textStyle,
      @Default(TextHorizontalAlign.left) TextHorizontalAlign horizontalAlign,
      @Default(TextVerticalAlign.bottom)
      TextVerticalAlign verticalAlign}) = _Cell;
}
