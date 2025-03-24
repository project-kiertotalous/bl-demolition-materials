import 'package:excel/excel.dart';

enum LineStyle {
  solid,
  none;
}

extension SolidExtension on LineStyle {
  Border get toExcelBorder {
    switch (this) {
      case LineStyle.solid:
        return Border(borderStyle: BorderStyle.Thin);
      default:
        return Border();
    }
  }
}
