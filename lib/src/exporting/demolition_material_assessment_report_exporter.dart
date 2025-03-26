import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../large_properties/demolition_material_assessment/total/exports.dart';
import '../utils/test_utils.dart';
import 'report_exporters/excel_report_exporter.dart';
import 'report_exporters/pdf_report_exporter.dart';
import 'structures/exportable_report.dart';

part 'demolition_material_assessment_report_exporter.freezed.dart';

@freezed
class DemolitionMaterialAssessmentReportExporter
    with _$DemolitionMaterialAssessmentReportExporter {
  DemolitionMaterialAssessmentReportExporter._();

  factory DemolitionMaterialAssessmentReportExporter(
          {required TotalDemolitionWasteAndCosts
              totalDemolitionWasteAndCosts}) =
      _DemolitionMaterialAssessmentReportExporter;

  void writeAsExcelSync(File file) {
    final exporter = ExcelReportExporter(_report,
        sheetName: 'Purkumateriaalien arviointilaskelma');
    file.writeAsBytesSync(exporter.export().encode()!);
  }

  void writeAsPdfSync(File file) {
    final exporter = PDFReportExporter(_report);
    exporter.export().save().then((val) => file.writeAsBytesSync(val));
  }

  ExportableReport get _report {
    return ExportableReport(tables: []);
  }
}

void main() {
  final File file = File('C:\\Users\\Hannu Korvala\\test.xlsx');
  file.createSync();
  DemolitionMaterialAssessmentReportExporter(
          totalDemolitionWasteAndCosts: TestUtils
              .sampleLargePropertiesRepository.totalDemolitionWasteAndCosts)
      .writeAsExcelSync(file);

  final File file2 = File('C:\\Users\\Hannu Korvala\\test.pdf');
  file2.createSync();
  DemolitionMaterialAssessmentReportExporter(
          totalDemolitionWasteAndCosts: TestUtils
              .sampleLargePropertiesRepository.totalDemolitionWasteAndCosts)
      .writeAsPdfSync(file2);
}
