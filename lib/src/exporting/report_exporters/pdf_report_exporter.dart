import 'dart:io';
import 'dart:isolate';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../structures/exports.dart';
import '../structures/styles/exports.dart';
import 'report_exporter.dart';

class PDFReportExporter extends ReportExporter<pw.Document> {
  final num fontScale;
  final num sizeScale;
  final double tableVerticalMargin;
  final double cellPadding;
  final List<double>? columnWidths;

  static pw.Font get font {
    final packageUri = Uri.parse('package:bl_demolition_materials/');
    final uri = Isolate.resolvePackageUriSync(packageUri);
    final fontUri = uri!.resolve('../assets/Carlito-Regular.ttf');
    final file = File.fromUri(fontUri);

    if (!file.existsSync()) {
      return pw.Font.helvetica();
    }

    return pw.Font.ttf(file.readAsBytesSync().buffer.asByteData());
  }

  static pw.Font get fontBold {
    final packageUri = Uri.parse('package:bl_demolition_materials/');
    final uri = Isolate.resolvePackageUriSync(packageUri);
    final fontUri = uri!.resolve('../assets/Carlito-Bold.ttf');
    final file = File.fromUri(fontUri);

    if (!file.existsSync()) {
      return pw.Font.helvetica();
    }

    return pw.Font.ttf(file.readAsBytesSync().buffer.asByteData());
  }

  const PDFReportExporter(super.report,
      {this.fontScale = 0.7,
      this.sizeScale = 0.55,
      this.tableVerticalMargin = 12,
      this.cellPadding = 2,
      this.columnWidths});

  @override
  pw.Document export() {
    final pdf = pw.Document();
    final List<pw.Widget> widgets = [];

    final Map<int, pw.TableColumnWidth> pdfColumnWidths = {};

    if (columnWidths != null) {
      for (int i = 0; i < columnWidths!.length; i++) {
        pdfColumnWidths[i] = pw.FixedColumnWidth(columnWidths![i]);
      }
    }

    for (final table in report.tables) {
      if (table.hint == Hint.none) {
        widgets.add(pw.Table(
            columnWidths: pdfColumnWidths,
            border: pw.TableBorder.all(style: pw.BorderStyle.none),
            children: [
              for (final row in table.rows)
                pw.TableRow(
                    decoration: getRowBoxDecoration(row),
                    // decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
                    children: [
                      for (final cell in row.cells)
                        pw.Container(
                            decoration: getRowBoxDecoration(row),
                            padding: pw.EdgeInsets.all(cellPadding),
                            child: pw.SizedBox(
                                height: row.height * sizeScale,
                                child: pw.Text(cell.valueString,
                                    style: pw.TextStyle(
                                        font: font,
                                        fontBold: fontBold,
                                        fontSize: cell.fontSize * fontScale,
                                        fontWeight: getCellFontWeight(cell)))))
                    ])
            ]));
      } else {
        for (final row in table.rows) {
          for (final cell in row.cells) {
            widgets.add(pw.Text(cell.valueString,
                style: pw.TextStyle(
                    font: font,
                    fontBold: fontBold,
                    fontSize: cell.fontSize * fontScale,
                    fontWeight: getCellFontWeight(cell))));
          }
        }
      }

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

  static pw.FontWeight getCellFontWeight(ReportCell cell) {
    return cell.textStyle == TextStyle.bold
        ? pw.FontWeight.bold
        : pw.FontWeight.normal;
  }

  static pw.BoxDecoration getRowBoxDecoration(ReportTableRow row) {
    if (row.borders) {
      return const pw.BoxDecoration(
          border: pw.Border(
        top: pw.BorderSide(width: 1, color: PdfColors.black),
        bottom: pw.BorderSide(width: 1, color: PdfColors.black),
        left: pw.BorderSide(width: 1, color: PdfColors.black),
        right: pw.BorderSide(width: 1, color: PdfColors.black),
      ));
    }

    return const pw.BoxDecoration(
        border: pw.Border(
      top: pw.BorderSide(style: pw.BorderStyle.none),
      bottom: pw.BorderSide(style: pw.BorderStyle.none),
      left: pw.BorderSide(style: pw.BorderStyle.none),
      right: pw.BorderSide(style: pw.BorderStyle.none),
    ));
  }
}
