import 'package:excel/excel.dart';

enum TextVerticalAlign {
  top,
  center,
  bottom,
}

enum TextHorizontalAlign {
  left,
  center,
  right,
}

extension TextHorizontalAlignExtensions on TextHorizontalAlign {
  HorizontalAlign get toExcelHorizontalAlign {
    switch (this) {
      case TextHorizontalAlign.left:
        return HorizontalAlign.Left;
      case TextHorizontalAlign.right:
        return HorizontalAlign.Right;
      case TextHorizontalAlign.center:
        return HorizontalAlign.Center;
    }
  }
}

extension TextVerticalAlignExtensions on TextVerticalAlign {
  VerticalAlign get toExcelVerticalAlign {
    switch (this) {
      case TextVerticalAlign.top:
        return VerticalAlign.Top;
      case TextVerticalAlign.center:
        return VerticalAlign.Center;
      case TextVerticalAlign.bottom:
        return VerticalAlign.Bottom;
    }
  }
}
