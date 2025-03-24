import 'dart:io';

abstract class ReportExporter {
  void writeAsExcelSync(File file);

  void writeAsPdfSync(File file);
}
