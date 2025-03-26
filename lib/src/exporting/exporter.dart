import 'dart:io';

/// A class that defines the interface which enables writing some instance to a file.
abstract class Exporter {
  /// Writes this instance to the provided file as an excel.
  void writeAsExcelSync(File file);

  /// Writes this instance to the provided file as PDF
  void writeAsPdfSync(File file);
}
