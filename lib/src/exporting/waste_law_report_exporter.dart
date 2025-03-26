import 'dart:io';

import 'package:bl_demolition_materials/src/exporting/report_exporters/excel_report_exporter.dart';
import 'package:bl_demolition_materials/src/exporting/report_exporters/pdf_report_exporter.dart';
import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../large_properties/waste_law_demolition_material_estimates/exports.dart';
import '../large_properties/waste_law_demolition_material_estimates/total/exports.dart';
import 'structures/exports.dart';
import 'structures/styles/exports.dart';

part 'waste_law_report_exporter.freezed.dart';

/// 'Jätelain mukainen taulukko' report table according to waste law
@freezed
class WasteLawReportExporter with _$WasteLawReportExporter {
  WasteLawReportExporter._();

  factory WasteLawReportExporter(
      {TotalConcreteBricksTilesCeramics? totalConcreteBricksTilesCeramics,
      TotalWoodGlassPlastics? totalWoodGlassPlastics,
      TotalBituminousMixturesCoalTarProducts?
          totalBituminousMixturesCoalTarProducts,
      TotalMetalsAndAlloys? totalMetalsAndAlloys,
      TotalSoilAggregatesDredgingMaterials?
          totalSoilAggregatesDredgingMaterials,
      InsulationAndAsbestosContainingMaterials?
          insulationAndAsbestosContainingMaterials,
      GypsumBasedBuildingMaterials? gypsumBasedBuildingMaterials,
      TotalOtherMaterials? totalOtherMaterials}) = _WasteLawReportExporter;

  void writeAsExcelSync(File file) {
    final exporter = ExcelReportExporter(_report,
        sheetName: 'Jätelain mukainen taulukko',
        columnWidths: [
          17,
          50,
          10,
          10,
          45
        ],
        cellMerges: [
          (
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0),
            CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)
          ),
          (
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2),
            CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 2)
          )
        ]);
    file.writeAsBytesSync(exporter.export().encode()!);
  }

  void writeAsPdfSync(File file) {
    final exporter =
        PDFReportExporter(_report, columnWidths: [17, 50, 10, 10, 45]);
    exporter.export().save().then((val) => file.writeAsBytesSync(val));
  }

  ExportableReport get _report {
    return ExportableReport(tables: [
      ReportTable(hint: Hint.title, rows: [
        ReportTableRow(borders: false, height: 26, cells: [
          ReportCell(),
          ReportCell(
              value: 'Purkumateriaalien määrä arvio',
              wrapText: false,
              fontSize: 20,
              horizontalAlign: TextHorizontalAlign.center)
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(),
          ReportCell(value: 'Jätelaki 17.6.2011/646 ', wrapText: false)
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(),
          ReportCell(
              value:
                  '17 RAKENTAMISESSA JA PURKAMISESSA SYNTYVÄT JÄTTEET (PILAANTUNEILTA',
              wrapText: false)
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(),
          ReportCell(
              value: 'ALUEILTA KAIVETUT MAA-AINEKSET MUKAAN LUETTUINA)',
              wrapText: false)
        ])
      ]),
      ReportTable(rows: [
        ReportTableRow(cells: [
          ReportCell(value: 'Jätekoodi', textStyle: TextStyle.bold),
          ReportCell(
              value:
                  'Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus',
              textStyle: TextStyle.bold),
          ReportCell(value: 'Tilavuus (m3)', textStyle: TextStyle.bold),
          ReportCell(value: 'Määrä-arvio (tonnia)', textStyle: TextStyle.bold),
          ReportCell(
              value: 'Huomautuksia ja lisätietoja', textStyle: TextStyle.bold)
        ], height: 45)
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 01', textStyle: TextStyle.bold),
              ReportCell(
                  value: 'betoni, tiilet, laatat ja keramiikka',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 01 01'),
          ReportCell(value: 'betoni'),
          ReportCell(value: totalConcreteBricksTilesCeramics?.concrete.volume),
          ReportCell(value: totalConcreteBricksTilesCeramics?.concrete.tons),
          ReportCell(value: totalConcreteBricksTilesCeramics?.concrete.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 01 02'),
          ReportCell(value: 'tiilet'),
          ReportCell(value: totalConcreteBricksTilesCeramics?.brick.volume),
          ReportCell(value: totalConcreteBricksTilesCeramics?.brick.tons),
          ReportCell(value: totalConcreteBricksTilesCeramics?.brick.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 01 03'),
          ReportCell(value: 'laatat ja keramiikka'),
          ReportCell(
              value: totalConcreteBricksTilesCeramics?.ceramicTiles.volume),
          ReportCell(
              value: totalConcreteBricksTilesCeramics?.ceramicTiles.tons),
          ReportCell(
              value: totalConcreteBricksTilesCeramics?.ceramicTiles.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 01 06*'),
          ReportCell(
              value:
                  'betonin, tiilten, laattojen ja keramiikan seokset tai lajitellut jakeet, jotka sisältävät vaarallisia aineita'),
          ReportCell(
              value: totalConcreteBricksTilesCeramics
                  ?.hazardousConcreteBrickTileCeramicMixtures.volume),
          ReportCell(
              value: totalConcreteBricksTilesCeramics
                  ?.hazardousConcreteBrickTileCeramicMixtures.tons),
          ReportCell(
              value: totalConcreteBricksTilesCeramics
                  ?.hazardousConcreteBrickTileCeramicMixtures.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 01 07'),
          ReportCell(
              value:
                  'muut kuin nimikkeessä 17 01 06 mainitut betonin, tiilten, laattojen ja keramiikan seokset'),
          ReportCell(
              value: totalConcreteBricksTilesCeramics?.otherMaterials?.volume),
          ReportCell(
              value: totalConcreteBricksTilesCeramics?.otherMaterials?.tons),
          ReportCell(
              value: totalConcreteBricksTilesCeramics?.otherMaterials?.notes),
        ], height: 40)
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 02', textStyle: TextStyle.bold),
              ReportCell(
                  value: 'puu, lasi ja muovit', textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 02 01'),
          ReportCell(value: 'puu'),
          ReportCell(value: totalWoodGlassPlastics?.wood.volume),
          ReportCell(value: totalWoodGlassPlastics?.wood.tons),
          ReportCell(value: totalWoodGlassPlastics?.wood.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 02 02'),
          ReportCell(value: 'lasi'),
          ReportCell(value: totalWoodGlassPlastics?.glass.volume),
          ReportCell(value: totalWoodGlassPlastics?.glass.tons),
          ReportCell(value: totalWoodGlassPlastics?.glass.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 02 03'),
          ReportCell(value: 'muovi'),
          ReportCell(value: totalWoodGlassPlastics?.plastic.volume),
          ReportCell(value: totalWoodGlassPlastics?.plastic.tons),
          ReportCell(value: totalWoodGlassPlastics?.plastic.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 02 04*'),
          ReportCell(
              value:
                  'lasi, muovi ja puu, jotka sisältävät vaarallisia aineita tai ovat niiden saastuttamia'),
          ReportCell(
              value: totalWoodGlassPlastics
                  ?.otherDangerousOrContaminatedMaterial.volume),
          ReportCell(
              value: totalWoodGlassPlastics
                  ?.otherDangerousOrContaminatedMaterial.tons),
          ReportCell(
              value: totalWoodGlassPlastics
                  ?.otherDangerousOrContaminatedMaterial.notes),
        ], height: 40)
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 03', textStyle: TextStyle.bold),
              ReportCell(
                  value: 'bitumiseokset, kivihiiliterva ja -tervatuotteet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 03 01*'),
          ReportCell(value: 'kivihiilitervaa sisältävät bitumiseokset'),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarContainingBituminousMixtures.volume),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarContainingBituminousMixtures.tons),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarContainingBituminousMixtures.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 03 02'),
          ReportCell(
              value: 'muut kuin nimikkeessä 17 03 01 mainitut bitumiseokset'),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.otherBituminousMixtures?.volume),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.otherBituminousMixtures?.tons),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.otherBituminousMixtures?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '179/2012 39'),
          ReportCell(),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts?.unnamed?.volume),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts?.unnamed?.tons),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts?.unnamed?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 02 01'),
          ReportCell(value: 'kivihiiliterva ja -tervatuotteett'),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarAndTarProducts?.volume),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarAndTarProducts?.tons),
          ReportCell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarAndTarProducts?.notes),
        ], height: 40),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 04', textStyle: TextStyle.bold),
              ReportCell(
                  value:
                      'metallit, niiden seokset (lejeeringit) mukaan luettuina',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 01'),
          ReportCell(value: 'kupari, pronssi, messinki'),
          ReportCell(value: totalMetalsAndAlloys?.copperBronzeAndBrass.volume),
          ReportCell(value: totalMetalsAndAlloys?.copperBronzeAndBrass.tons),
          ReportCell(value: totalMetalsAndAlloys?.copperBronzeAndBrass.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 02'),
          ReportCell(value: 'alumiini'),
          ReportCell(value: totalMetalsAndAlloys?.aluminium.volume),
          ReportCell(value: totalMetalsAndAlloys?.aluminium.tons),
          ReportCell(value: totalMetalsAndAlloys?.aluminium.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 03'),
          ReportCell(value: 'lyijy'),
          ReportCell(value: totalMetalsAndAlloys?.lead?.volume),
          ReportCell(value: totalMetalsAndAlloys?.lead?.tons),
          ReportCell(value: totalMetalsAndAlloys?.lead?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 04'),
          ReportCell(value: 'sinkki'),
          ReportCell(value: totalMetalsAndAlloys?.zinc?.volume),
          ReportCell(value: totalMetalsAndAlloys?.zinc?.tons),
          ReportCell(value: totalMetalsAndAlloys?.zinc?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 05'),
          ReportCell(value: 'rauta ja teräs'),
          ReportCell(value: totalMetalsAndAlloys?.ironAndSteel.volume),
          ReportCell(value: totalMetalsAndAlloys?.ironAndSteel.tons),
          ReportCell(value: totalMetalsAndAlloys?.ironAndSteel.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 06'),
          ReportCell(value: 'rauta ja teräs'),
          ReportCell(value: totalMetalsAndAlloys?.tin?.volume),
          ReportCell(value: totalMetalsAndAlloys?.tin?.tons),
          ReportCell(value: totalMetalsAndAlloys?.tin?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 07'),
          ReportCell(value: 'sekalaiset metallit'),
          ReportCell(value: totalMetalsAndAlloys?.mixedMetals.volume),
          ReportCell(value: totalMetalsAndAlloys?.mixedMetals.tons),
          ReportCell(value: totalMetalsAndAlloys?.mixedMetals.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 09*'),
          ReportCell(
              value:
                  'metallijätteet, jotka ovat vaarallisten aineiden saastuttamia'),
          ReportCell(
              value: totalMetalsAndAlloys?.contaminatedMetalWaste?.volume),
          ReportCell(value: totalMetalsAndAlloys?.contaminatedMetalWaste?.tons),
          ReportCell(
              value: totalMetalsAndAlloys?.contaminatedMetalWaste?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 10*'),
          ReportCell(
              value:
                  'öljyä, kivihiilitervaa tai muita vaarallisia aineita sisältävät kaapelit'),
          ReportCell(
              value: totalMetalsAndAlloys?.hazardousOilAndTarCables?.volume),
          ReportCell(
              value: totalMetalsAndAlloys?.hazardousOilAndTarCables?.tons),
          ReportCell(
              value: totalMetalsAndAlloys?.hazardousOilAndTarCables?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 04 11'),
          ReportCell(value: 'muut kuin nimikkeessä 17 04 10 mainitut kaapelit'),
          ReportCell(value: totalMetalsAndAlloys?.otherCables?.volume),
          ReportCell(value: totalMetalsAndAlloys?.otherCables?.tons),
          ReportCell(value: totalMetalsAndAlloys?.otherCables?.notes),
        ], height: 40),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 05', textStyle: TextStyle.bold),
              ReportCell(
                  value:
                      'maa-ainekset (pilaantuneilta alueilta kaivetut maa-ainekset mukaan luettuina), kiviainekset ja ruoppausmassat',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 05 03*'),
          ReportCell(
              value:
                  'maa- ja kiviainekset, jotka sisältävät vaarallisia aineita'),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousSoilAndRock.volume),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousSoilAndRock.tons),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousSoilAndRock.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 05 04'),
          ReportCell(
              value:
                  'muut kuin nimikkeessä 17 05 03 mainitut maa- ja kiviainekset'),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials?.soilAndRock?.volume),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials?.soilAndRock?.tons),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials?.soilAndRock?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 05 05*'),
          ReportCell(
              value: 'ruoppausmassat, jotka sisältävät vaarallisia aineita'),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousDredgingSpoil?.volume),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousDredgingSpoil?.tons),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousDredgingSpoil?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 05 06'),
          ReportCell(
              value: 'muut kuin nimikkeessä 17 05 05 mainitut ruoppausmassat'),
          ReportCell(
              value:
                  totalSoilAggregatesDredgingMaterials?.dredgingSpoil?.volume),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials?.dredgingSpoil?.tons),
          ReportCell(
              value:
                  totalSoilAggregatesDredgingMaterials?.dredgingSpoil?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 05 07*'),
          ReportCell(
              value:
                  'ratapenkereiden sorapäällysteet, jotka sisältävät vaarallisia aineita'),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousRailwayBallast?.volume),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousRailwayBallast?.tons),
          ReportCell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousRailwayBallast?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 05 08'),
          ReportCell(
              value:
                  'muut kuin nimikkeessä 17 05 07 mainitut ratapenkereiden sorapäällysteet'),
          ReportCell(
              value:
                  totalSoilAggregatesDredgingMaterials?.railwayBallast?.volume),
          ReportCell(
              value:
                  totalSoilAggregatesDredgingMaterials?.railwayBallast?.tons),
          ReportCell(
              value:
                  totalSoilAggregatesDredgingMaterials?.railwayBallast?.notes),
        ], height: 40),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 06', textStyle: TextStyle.bold),
              ReportCell(
                  value: 'eristysaineet ja asbestia sisältävät rakennusaineet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 06 01*'),
          ReportCell(value: 'asbestia sisältävät eristysaineet'),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingInsulationMaterials?.volume),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingInsulationMaterials?.tons),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingInsulationMaterials?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 06 03*'),
          ReportCell(
              value:
                  'muut eristysaineet, jotka koostuvat vaarallisista aineista tai sisältävät niitä'),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherHazardousInsulationMaterials?.volume),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherHazardousInsulationMaterials?.tons),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherHazardousInsulationMaterials?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 06 04'),
          ReportCell(
              value:
                  'muut kuin nimikkeissä 17 06 01 ja 17 06 03 mainitut eristysaineet'),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherInsulationMaterials?.volume),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherInsulationMaterials?.tons),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherInsulationMaterials?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 06 05*'),
          ReportCell(value: 'asbestia sisältävät rakennusaineet'),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingBuildingMaterials?.volume),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingBuildingMaterials?.tons),
          ReportCell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingBuildingMaterials?.notes),
        ], height: 40),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 08', textStyle: TextStyle.bold),
              ReportCell(
                  value: 'kipsipohjaiset rakennusaineet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 08 01*'),
          ReportCell(
              value:
                  'kipsipohjaiset rakennusaineet, jotka ovat vaarallisten aineiden saastuttamia'),
          ReportCell(
              value: gypsumBasedBuildingMaterials
                  ?.contaminatedGypsumBasedMaterials?.volume),
          ReportCell(
              value: gypsumBasedBuildingMaterials
                  ?.contaminatedGypsumBasedMaterials?.tons),
          ReportCell(
              value: gypsumBasedBuildingMaterials
                  ?.contaminatedGypsumBasedMaterials?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 08 02'),
          ReportCell(
              value:
                  'muut kuin nimikkeessä 17 08 01 mainitut kipsipohjaiset rakennusaineet'),
          ReportCell(
              value: gypsumBasedBuildingMaterials
                  ?.otherGypsumBasedMaterials?.volume),
          ReportCell(
              value: gypsumBasedBuildingMaterials
                  ?.otherGypsumBasedMaterials?.tons),
          ReportCell(
              value: gypsumBasedBuildingMaterials
                  ?.otherGypsumBasedMaterials?.notes),
        ], height: 40),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 09', textStyle: TextStyle.bold),
              ReportCell(
                  value: 'muut rakentamisessa ja purkamisessa syntyvät jätteet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        ReportTableRow(cells: [
          ReportCell(value: '17 09 01*'),
          ReportCell(
              value:
                  'rakentamisessa ja purkamisessa syntyvät jätteet, jotka sisältävät elohopeaa'),
          ReportCell(
              value: totalOtherMaterials?.mercuryContainingMaterials?.volume),
          ReportCell(
              value: totalOtherMaterials?.mercuryContainingMaterials?.tons),
          ReportCell(
              value: totalOtherMaterials?.mercuryContainingMaterials?.notes),
        ], height: 40),
        ReportTableRow(cells: [
          ReportCell(value: '17 09 02*'),
          ReportCell(
              value:
                  'rakentamisessa ja purkamisessa syntyvät jätteet, jotka sisältävät PCB:tä (kuten PCB:tä sisältävät tiivistysmassat, PCB:tä sisältävät hartsipohjaiset lattiapäällysteet, PCB:tä sisältävät umpiolasit ja PCB:tä sisältävät muuntajat'),
          ReportCell(
              value: totalOtherMaterials?.pcbContainingDemolitionWaste.volume),
          ReportCell(
              value: totalOtherMaterials?.pcbContainingDemolitionWaste.tons),
          ReportCell(
              value: totalOtherMaterials?.pcbContainingDemolitionWaste.notes),
        ], height: 90),
        ReportTableRow(cells: [
          ReportCell(value: '17 09 03*'),
          ReportCell(
              value:
                  'muut rakentamisessa ja purkamisessa syntyvät jätteet (sekalaiset jätteet mukaan luettuna), jotka sisältävät vaarallisia aineita'),
          ReportCell(
              value:
                  totalOtherMaterials?.otherHazardousDemolitionWaste?.volume),
          ReportCell(
              value: totalOtherMaterials?.otherHazardousDemolitionWaste?.tons),
          ReportCell(
              value: totalOtherMaterials?.otherHazardousDemolitionWaste?.notes),
        ], height: 45),
        ReportTableRow(cells: [
          ReportCell(value: '17 09 04'),
          ReportCell(
              value:
                  'muut kuin nimikkeissä 17 09 01, 17 09 02 ja 17 09 03 mainitut rakentamisessa ja purkamisessa syntyvät sekalaiset jätteet'),
          ReportCell(value: totalOtherMaterials?.otherDemolitionWaste?.volume),
          ReportCell(value: totalOtherMaterials?.otherDemolitionWaste?.tons),
          ReportCell(value: totalOtherMaterials?.otherDemolitionWaste?.notes),
        ], height: 45),
      ]),
    ]);
  }
}
