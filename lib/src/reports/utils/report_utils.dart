import 'package:bl_demolition_materials/src/reports/structures/styles/line_style.dart';
import 'package:bl_demolition_materials/src/reports/structures/styles/text_align.dart';
import 'package:excel/excel.dart';

import '../structures/exports.dart';
import '../structures/styles/exports.dart';

class ReportUtils {
  static Excel reportToExcel(
      {required Report report,
      required String sheetName,
      List<double>? columnWidths}) {
    final excel = Excel.createExcel();
    excel.rename('Sheet1', sheetName);
    final sheet = excel.sheets[sheetName]!;
    var rowIndex = 0;
    var columnIndex = 0;

    if (columnWidths != null) {
      for (int i = 0; i < columnWidths.length; i++) {
        sheet.setColumnWidth(i, columnWidths[i]);
      }
    }

    for (final table in report.tables) {
      for (final row in table.rows) {
        for (final cell in row.cells) {
          final excelCell = sheet.cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex, rowIndex: rowIndex));

          excelCell.value = cell.valueAsExcelValue;
          excelCell.cellStyle = CellStyle(
              bold: cell.textStyle == TextStyle.bold,
              horizontalAlign: cell.horizontalAlign.toExcelHorizontalAlign,
              verticalAlign: cell.verticalAlign.toExcelVerticalAlign,
              textWrapping:
                  cell.wrapText ? TextWrapping.WrapText : TextWrapping.Clip,
              topBorder: row.borderStyle[0].toExcelBorder,
              rightBorder: row.borderStyle[1].toExcelBorder,
              bottomBorder: row.borderStyle[2].toExcelBorder,
              leftBorder: row.borderStyle[3].toExcelBorder,
              fontSize: cell.fontSize,
              fontFamily: cell.fontFamily,
              numberFormat: cell.excelFormat);

          columnIndex += 1;
        }

        if (row.height != null) {
          sheet.setRowHeight(rowIndex, row.height!);
        }

        rowIndex += 1;
        columnIndex = 0;
      }

      rowIndex += 1;
    }
    return excel;
  }
}
