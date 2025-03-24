import 'dart:io';

import 'package:bl_demolition_materials/src/reports/structures/styles/text_align.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../large_properties/waste_law_demolition_material_estimates/exports.dart';
import '../large_properties/waste_law_demolition_material_estimates/total/exports.dart';
import 'report_exporter.dart';
import 'structures/exports.dart';
import 'structures/styles/exports.dart';
import 'utils/report_utils.dart';

part 'waste_law_report_exporter.freezed.dart';

@freezed
class WasteLawReportExporter extends ReportExporter
    with _$WasteLawReportExporter {
  WasteLawReportExporter._();

  factory WasteLawReportExporter(
      {TotalConcreteBricksTilesCeramics? totalConcreteBricksTilesCeramics,
        TotalWoodGlassPlastics? totalWoodGlassPlastics,
        TotalBituminousMixturesCoalTarProducts? totalBituminousMixturesCoalTarProducts,
        TotalMetalsAndAlloys? totalMetalsAndAlloys,
        TotalSoilAggregatesDredgingMaterials? totalSoilAggregatesDredgingMaterials,
        InsulationAndAsbestosContainingMaterials?
        insulationAndAsbestosContainingMaterials,
        GypsumBasedBuildingMaterials? gypsumBasedBuildingMaterials,
        TotalOtherMaterials? totalOtherMaterials}) = _WasteLawReportExporter;

  @override
  void writeAsExcelSync(File file) {
    final excel =
    ReportUtils.reportToExcel(_report, 'Jätelain mukainen taulukko')
        .encode()!;
    file.writeAsBytesSync(excel);
  }

  @override
  void writeAsPdfSync(File file) {
    throw UnimplementedError();
  }

  Report get _report {
    return Report(columnWidths: [
      17,
      50,
      10,
      10,
      45
    ], tables: [
      Table(rows: [
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(
              text: 'Purkumateriaalien määrä arvio',
              wrapText: false,
              fontSize: 20,
              horizontalAlign: TextHorizontalAlign.center)
        ]),
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(text: 'Jätelaki 17.6.2011/646 ', wrapText: false)
        ]),
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(
              text:
              '17 RAKENTAMISESSA JA PURKAMISESSA SYNTYVÄT JÄTTEET (PILAANTUNEILTA',
              wrapText: false)
        ]),
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(
              text: 'ALUEILTA KAIVETUT MAA-AINEKSET MUKAAN LUETTUINA)',
              wrapText: false)
        ])
      ]),
      Table(rows: [
        Row(cells: [
          Cell(text: 'Jätekoodi', textStyle: TextStyle.bold),
          Cell(
              text:
              'Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus',
              textStyle: TextStyle.bold),
          Cell(text: 'Tilavuus (m3)', textStyle: TextStyle.bold),
          Cell(text: 'Määrä-arvio (tonnia)', textStyle: TextStyle.bold),
          Cell(text: 'Huomautuksia ja lisätietoja', textStyle: TextStyle.bold)
        ], height: 45),
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(text: '17 01', textStyle: TextStyle.bold),
              Cell(
                  text: 'betoni, tiilet, laatat ja keramiikka',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(
            cells: [
              Cell(text: '17 01 01'),
              Cell(text: 'betoni'),
              Cell(text: totalConcreteBricksTilesCeramics?.concrete.volume.toString() ?? ''),
              Cell(text: totalConcreteBricksTilesCeramics?.concrete.tons.toString() ?? ''),
              Cell(text: totalConcreteBricksTilesCeramics?.concrete.notes.toString() ?? ''),
            ],
            height: 40
        )
      ])
    ]);
  }
}

void main() {
  final WasteLawReportExporter report = WasteLawReportExporter(
      totalConcreteBricksTilesCeramics: TotalConcreteBricksTilesCeramics(),
      totalWoodGlassPlastics: TotalWoodGlassPlastics(),
      totalBituminousMixturesCoalTarProducts: TotalBituminousMixturesCoalTarProducts(),
      totalMetalsAndAlloys: TotalMetalsAndAlloys(),
      totalSoilAggregatesDredgingMaterials: TotalSoilAggregatesDredgingMaterials(),
      insulationAndAsbestosContainingMaterials:
      InsulationAndAsbestosContainingMaterials(),
      gypsumBasedBuildingMaterials: GypsumBasedBuildingMaterials(),
      totalOtherMaterials: TotalOtherMaterials());

  final File file = File('C:\\Users\\Hannu Korvala\\test.xlsx');
  file.createSync();
  report.writeAsExcelSync(file);
}
