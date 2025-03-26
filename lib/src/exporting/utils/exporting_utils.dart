import 'package:excel/excel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../structures/exports.dart';
import '../structures/styles/exports.dart';

/// An utility class that can be used to convert instances of ExportableReport
/// into Excel or pw.Document instances.
class ReportUtils {
  static Border getRowBorderStyle(ReportTableRow row) {
    return row.borders
        ? Border(borderStyle: BorderStyle.Thin)
        : Border(borderStyle: BorderStyle.None);
  }

  static HorizontalAlign horizontalAlignToExcel(TextHorizontalAlign align) {
    switch (align) {
      case TextHorizontalAlign.left:
        return HorizontalAlign.Left;
      case TextHorizontalAlign.right:
        return HorizontalAlign.Right;
      case TextHorizontalAlign.center:
        return HorizontalAlign.Center;
    }
  }

  static VerticalAlign verticalAlignToExcel(TextVerticalAlign align) {
    switch (align) {
      case TextVerticalAlign.top:
        return VerticalAlign.Top;
      case TextVerticalAlign.center:
        return VerticalAlign.Center;
      case TextVerticalAlign.bottom:
        return VerticalAlign.Bottom;
    }
  }

  static Excel reportToExcel(
      {required ExportableReport report,
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
              horizontalAlign: horizontalAlignToExcel(cell.horizontalAlign),
              verticalAlign: verticalAlignToExcel(cell.verticalAlign),
              textWrapping:
                  cell.wrapText ? TextWrapping.WrapText : TextWrapping.Clip,
              topBorder: getRowBorderStyle(row),
              rightBorder: getRowBorderStyle(row),
              bottomBorder: getRowBorderStyle(row),
              leftBorder: getRowBorderStyle(row),
              fontSize: cell.fontSize.toInt(),
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

  static pw.Document reportToPdf(
      {required ExportableReport report,
      num fontScale = 0.7,
      double tableVerticalMargin = 12,
      List<double>? columnWidths}) {
    final pdf = pw.Document();
    final List<pw.Widget> widgets = [];

    final Map<int, pw.TableColumnWidth> pdfColumnWidths = {};

    if (columnWidths != null) {
      for (int i = 0; i < columnWidths.length; i++) {
        pdfColumnWidths[i] = pw.FixedColumnWidth(columnWidths[i]);
      }
    }

    for (final table in report.tables) {
      widgets.add(pw.Table(
          border: table.hasBorders
              ? pw.TableBorder.all()
              : pw.TableBorder.all(style: pw.BorderStyle.none),
          columnWidths: pdfColumnWidths,
          children: [
            for (final row in table.rows)
              pw.TableRow(
                  // decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
                  children: [
                    for (final cell in row.cells)
                      pw.Padding(
                          padding: pw.EdgeInsets.all(2),
                          child: pw.Text(cell.valueString,
                              style: pw.TextStyle(
                                  fontSize: cell.fontSize * fontScale,
                                  fontWeight: cell.textStyle == TextStyle.bold
                                      ? pw.FontWeight.bold
                                      : pw.FontWeight.normal)))
                  ])
          ]));

      widgets.add(pw.SizedBox(height: tableVerticalMargin));
    }

    final page = pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return widgets;
        });

    pdf.addPage(page);

    return pdf;
  }
}
