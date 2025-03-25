import 'dart:io';

import 'package:bl_demolition_materials/src/reports/structures/styles/text_align.dart';
import 'package:bl_demolition_materials/src/utils/test_utils.dart';
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
      TotalBituminousMixturesCoalTarProducts?
          totalBituminousMixturesCoalTarProducts,
      TotalMetalsAndAlloys? totalMetalsAndAlloys,
      TotalSoilAggregatesDredgingMaterials?
          totalSoilAggregatesDredgingMaterials,
      InsulationAndAsbestosContainingMaterials?
          insulationAndAsbestosContainingMaterials,
      GypsumBasedBuildingMaterials? gypsumBasedBuildingMaterials,
      TotalOtherMaterials? totalOtherMaterials}) = _WasteLawReportExporter;

  @override
  void writeAsExcelSync(File file) {
    final excel = ReportUtils.reportToExcel(
        report: _report,
        sheetName: 'Jätelain mukainen taulukko',
        columnWidths: [17, 50, 10, 10, 45]).encode()!;
    file.writeAsBytesSync(excel);
  }

  @override
  void writeAsPdfSync(File file) {
    throw UnimplementedError();
  }

  Report get _report {
    return Report(tables: [
      Table(rows: [
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(
              value: 'Purkumateriaalien määrä arvio',
              wrapText: false,
              fontSize: 20,
              horizontalAlign: TextHorizontalAlign.center)
        ]),
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(value: 'Jätelaki 17.6.2011/646 ', wrapText: false)
        ]),
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(
              value:
                  '17 RAKENTAMISESSA JA PURKAMISESSA SYNTYVÄT JÄTTEET (PILAANTUNEILTA',
              wrapText: false)
        ]),
        Row(borderStyle: RowStyles.styleNoBorders, cells: [
          Cell(),
          Cell(
              value: 'ALUEILTA KAIVETUT MAA-AINEKSET MUKAAN LUETTUINA)',
              wrapText: false)
        ])
      ]),
      Table(rows: [
        Row(cells: [
          Cell(value: 'Jätekoodi', textStyle: TextStyle.bold),
          Cell(
              value:
                  'Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus',
              textStyle: TextStyle.bold),
          Cell(value: 'Tilavuus (m3)', textStyle: TextStyle.bold),
          Cell(value: 'Määrä-arvio (tonnia)', textStyle: TextStyle.bold),
          Cell(value: 'Huomautuksia ja lisätietoja', textStyle: TextStyle.bold)
        ], height: 45),
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 01', textStyle: TextStyle.bold),
              Cell(
                  value: 'betoni, tiilet, laatat ja keramiikka',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 01 01'),
          Cell(value: 'betoni'),
          Cell(value: totalConcreteBricksTilesCeramics?.concrete.volume),
          Cell(value: totalConcreteBricksTilesCeramics?.concrete.tons),
          Cell(value: totalConcreteBricksTilesCeramics?.concrete.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 01 02'),
          Cell(value: 'tiilet'),
          Cell(value: totalConcreteBricksTilesCeramics?.brick.volume),
          Cell(value: totalConcreteBricksTilesCeramics?.brick.tons),
          Cell(value: totalConcreteBricksTilesCeramics?.brick.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 01 03'),
          Cell(value: 'laatat ja keramiikka'),
          Cell(value: totalConcreteBricksTilesCeramics?.ceramicTiles.volume),
          Cell(value: totalConcreteBricksTilesCeramics?.ceramicTiles.tons),
          Cell(value: totalConcreteBricksTilesCeramics?.ceramicTiles.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 01 06*'),
          Cell(
              value:
                  'betonin, tiilten, laattojen ja keramiikan seokset tai lajitellut jakeet, jotka sisältävät vaarallisia aineita'),
          Cell(
              value: totalConcreteBricksTilesCeramics
                  ?.hazardousConcreteBrickTileCeramicMixtures.volume),
          Cell(
              value: totalConcreteBricksTilesCeramics
                  ?.hazardousConcreteBrickTileCeramicMixtures.tons),
          Cell(
              value: totalConcreteBricksTilesCeramics
                  ?.hazardousConcreteBrickTileCeramicMixtures.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 01 07'),
          Cell(
              value:
                  'muut kuin nimikkeessä 17 01 06 mainitut betonin, tiilten, laattojen ja keramiikan seokset'),
          Cell(value: totalConcreteBricksTilesCeramics?.otherMaterials?.volume),
          Cell(value: totalConcreteBricksTilesCeramics?.otherMaterials?.tons),
          Cell(value: totalConcreteBricksTilesCeramics?.otherMaterials?.notes),
        ], height: 40)
      ]),
      Table(rows: [
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 02', textStyle: TextStyle.bold),
              Cell(value: 'puu, lasi ja muovit', textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 02 01'),
          Cell(value: 'puu'),
          Cell(value: totalWoodGlassPlastics?.wood.volume),
          Cell(value: totalWoodGlassPlastics?.wood.tons),
          Cell(value: totalWoodGlassPlastics?.wood.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 02 02'),
          Cell(value: 'lasi'),
          Cell(value: totalWoodGlassPlastics?.glass.volume),
          Cell(value: totalWoodGlassPlastics?.glass.tons),
          Cell(value: totalWoodGlassPlastics?.glass.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 02 03'),
          Cell(value: 'muovi'),
          Cell(value: totalWoodGlassPlastics?.plastic.volume),
          Cell(value: totalWoodGlassPlastics?.plastic.tons),
          Cell(value: totalWoodGlassPlastics?.plastic.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 02 04*'),
          Cell(
              value:
                  'lasi, muovi ja puu, jotka sisältävät vaarallisia aineita tai ovat niiden saastuttamia'),
          Cell(
              value: totalWoodGlassPlastics
                  ?.otherDangerousOrContaminatedMaterial.volume),
          Cell(
              value: totalWoodGlassPlastics
                  ?.otherDangerousOrContaminatedMaterial.tons),
          Cell(
              value: totalWoodGlassPlastics
                  ?.otherDangerousOrContaminatedMaterial.notes),
        ], height: 40)
      ]),
      Table(rows: [
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 03', textStyle: TextStyle.bold),
              Cell(
                  value: 'bitumiseokset, kivihiiliterva ja -tervatuotteet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 03 01*'),
          Cell(value: 'kivihiilitervaa sisältävät bitumiseokset'),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarContainingBituminousMixtures.volume),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarContainingBituminousMixtures.tons),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarContainingBituminousMixtures.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 03 02'),
          Cell(value: 'muut kuin nimikkeessä 17 03 01 mainitut bitumiseokset'),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.otherBituminousMixtures?.volume),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.otherBituminousMixtures?.tons),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.otherBituminousMixtures?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '179/2012 39'),
          Cell(),
          Cell(value: totalBituminousMixturesCoalTarProducts?.unnamed?.volume),
          Cell(value: totalBituminousMixturesCoalTarProducts?.unnamed?.tons),
          Cell(value: totalBituminousMixturesCoalTarProducts?.unnamed?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 02 01'),
          Cell(value: 'kivihiiliterva ja -tervatuotteett'),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarAndTarProducts?.volume),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarAndTarProducts?.tons),
          Cell(
              value: totalBituminousMixturesCoalTarProducts
                  ?.coalTarAndTarProducts?.notes),
        ], height: 40),
      ]),
      Table(rows: [
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 04', textStyle: TextStyle.bold),
              Cell(
                  value:
                      'metallit, niiden seokset (lejeeringit) mukaan luettuina',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 04 01'),
          Cell(value: 'kupari, pronssi, messinki'),
          Cell(value: totalMetalsAndAlloys?.copperBronzeAndBrass.volume),
          Cell(value: totalMetalsAndAlloys?.copperBronzeAndBrass.tons),
          Cell(value: totalMetalsAndAlloys?.copperBronzeAndBrass.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 02'),
          Cell(value: 'alumiini'),
          Cell(value: totalMetalsAndAlloys?.aluminium.volume),
          Cell(value: totalMetalsAndAlloys?.aluminium.tons),
          Cell(value: totalMetalsAndAlloys?.aluminium.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 03'),
          Cell(value: 'lyijy'),
          Cell(value: totalMetalsAndAlloys?.lead?.volume),
          Cell(value: totalMetalsAndAlloys?.lead?.tons),
          Cell(value: totalMetalsAndAlloys?.lead?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 04'),
          Cell(value: 'sinkki'),
          Cell(value: totalMetalsAndAlloys?.zinc?.volume),
          Cell(value: totalMetalsAndAlloys?.zinc?.tons),
          Cell(value: totalMetalsAndAlloys?.zinc?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 05'),
          Cell(value: 'rauta ja teräs'),
          Cell(value: totalMetalsAndAlloys?.ironAndSteel.volume),
          Cell(value: totalMetalsAndAlloys?.ironAndSteel.tons),
          Cell(value: totalMetalsAndAlloys?.ironAndSteel.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 06'),
          Cell(value: 'rauta ja teräs'),
          Cell(value: totalMetalsAndAlloys?.tin?.volume),
          Cell(value: totalMetalsAndAlloys?.tin?.tons),
          Cell(value: totalMetalsAndAlloys?.tin?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 07'),
          Cell(value: 'sekalaiset metallit'),
          Cell(value: totalMetalsAndAlloys?.mixedMetals.volume),
          Cell(value: totalMetalsAndAlloys?.mixedMetals.tons),
          Cell(value: totalMetalsAndAlloys?.mixedMetals.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 09*'),
          Cell(
              value:
                  'metallijätteet, jotka ovat vaarallisten aineiden saastuttamia'),
          Cell(value: totalMetalsAndAlloys?.contaminatedMetalWaste?.volume),
          Cell(value: totalMetalsAndAlloys?.contaminatedMetalWaste?.tons),
          Cell(value: totalMetalsAndAlloys?.contaminatedMetalWaste?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 10*'),
          Cell(
              value:
                  'öljyä, kivihiilitervaa tai muita vaarallisia aineita sisältävät kaapelit'),
          Cell(value: totalMetalsAndAlloys?.hazardousOilAndTarCables?.volume),
          Cell(value: totalMetalsAndAlloys?.hazardousOilAndTarCables?.tons),
          Cell(value: totalMetalsAndAlloys?.hazardousOilAndTarCables?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 04 11'),
          Cell(value: 'muut kuin nimikkeessä 17 04 10 mainitut kaapelit'),
          Cell(value: totalMetalsAndAlloys?.otherCables?.volume),
          Cell(value: totalMetalsAndAlloys?.otherCables?.tons),
          Cell(value: totalMetalsAndAlloys?.otherCables?.notes),
        ], height: 40),
      ]),
      Table(rows: [
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 05', textStyle: TextStyle.bold),
              Cell(
                  value:
                      'maa-ainekset (pilaantuneilta alueilta kaivetut maa-ainekset mukaan luettuina), kiviainekset ja ruoppausmassat',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 05 03*'),
          Cell(
              value:
                  'maa- ja kiviainekset, jotka sisältävät vaarallisia aineita'),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousSoilAndRock.volume),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousSoilAndRock.tons),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousSoilAndRock.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 05 04'),
          Cell(
              value:
                  'muut kuin nimikkeessä 17 05 03 mainitut maa- ja kiviainekset'),
          Cell(
              value: totalSoilAggregatesDredgingMaterials?.soilAndRock?.volume),
          Cell(value: totalSoilAggregatesDredgingMaterials?.soilAndRock?.tons),
          Cell(value: totalSoilAggregatesDredgingMaterials?.soilAndRock?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 05 05*'),
          Cell(value: 'ruoppausmassat, jotka sisältävät vaarallisia aineita'),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousDredgingSpoil?.volume),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousDredgingSpoil?.tons),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousDredgingSpoil?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 05 06'),
          Cell(value: 'muut kuin nimikkeessä 17 05 05 mainitut ruoppausmassat'),
          Cell(
              value:
                  totalSoilAggregatesDredgingMaterials?.dredgingSpoil?.volume),
          Cell(
              value: totalSoilAggregatesDredgingMaterials?.dredgingSpoil?.tons),
          Cell(
              value:
                  totalSoilAggregatesDredgingMaterials?.dredgingSpoil?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 05 07*'),
          Cell(
              value:
                  'ratapenkereiden sorapäällysteet, jotka sisältävät vaarallisia aineita'),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousRailwayBallast?.volume),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousRailwayBallast?.tons),
          Cell(
              value: totalSoilAggregatesDredgingMaterials
                  ?.hazardousRailwayBallast?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 05 08'),
          Cell(
              value:
                  'muut kuin nimikkeessä 17 05 07 mainitut ratapenkereiden sorapäällysteet'),
          Cell(
              value:
                  totalSoilAggregatesDredgingMaterials?.railwayBallast?.volume),
          Cell(
              value:
                  totalSoilAggregatesDredgingMaterials?.railwayBallast?.tons),
          Cell(
              value:
                  totalSoilAggregatesDredgingMaterials?.railwayBallast?.notes),
        ], height: 40),
      ]),
      Table(rows: [
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 06', textStyle: TextStyle.bold),
              Cell(
                  value: 'eristysaineet ja asbestia sisältävät rakennusaineet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 06 01*'),
          Cell(value: 'asbestia sisältävät eristysaineet'),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingInsulationMaterials?.volume),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingInsulationMaterials?.tons),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingInsulationMaterials?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 06 03*'),
          Cell(
              value:
                  'muut eristysaineet, jotka koostuvat vaarallisista aineista tai sisältävät niitä'),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherHazardousInsulationMaterials?.volume),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherHazardousInsulationMaterials?.tons),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherHazardousInsulationMaterials?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 06 04'),
          Cell(
              value:
                  'muut kuin nimikkeissä 17 06 01 ja 17 06 03 mainitut eristysaineet'),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherInsulationMaterials?.volume),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherInsulationMaterials?.tons),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.otherInsulationMaterials?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 06 05*'),
          Cell(value: 'asbestia sisältävät rakennusaineet'),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingBuildingMaterials?.volume),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingBuildingMaterials?.tons),
          Cell(
              value: insulationAndAsbestosContainingMaterials
                  ?.asbestosContainingBuildingMaterials?.notes),
        ], height: 40),
      ]),
      Table(rows: [
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 08', textStyle: TextStyle.bold),
              Cell(
                  value: 'kipsipohjaiset rakennusaineet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 08 01*'),
          Cell(
              value:
                  'kipsipohjaiset rakennusaineet, jotka ovat vaarallisten aineiden saastuttamia'),
          Cell(
              value: gypsumBasedBuildingMaterials
                  ?.contaminatedGypsumBasedMaterials?.volume),
          Cell(
              value: gypsumBasedBuildingMaterials
                  ?.contaminatedGypsumBasedMaterials?.tons),
          Cell(
              value: gypsumBasedBuildingMaterials
                  ?.contaminatedGypsumBasedMaterials?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 08 02'),
          Cell(
              value:
                  'muut kuin nimikkeessä 17 08 01 mainitut kipsipohjaiset rakennusaineet'),
          Cell(
              value: gypsumBasedBuildingMaterials
                  ?.otherGypsumBasedMaterials?.volume),
          Cell(
              value: gypsumBasedBuildingMaterials
                  ?.otherGypsumBasedMaterials?.tons),
          Cell(
              value: gypsumBasedBuildingMaterials
                  ?.otherGypsumBasedMaterials?.notes),
        ], height: 40),
      ]),
      Table(rows: [
        Row(
            borderStyle: RowStyles.styleNoBorders,
            cells: [
              Cell(value: '17 09', textStyle: TextStyle.bold),
              Cell(
                  value: 'muut rakentamisessa ja purkamisessa syntyvät jätteet',
                  textStyle: TextStyle.bold),
            ],
            height: 15),
        Row(cells: [
          Cell(value: '17 09 01*'),
          Cell(
              value:
                  'rakentamisessa ja purkamisessa syntyvät jätteet, jotka sisältävät elohopeaa'),
          Cell(value: totalOtherMaterials?.mercuryContainingMaterials?.volume),
          Cell(value: totalOtherMaterials?.mercuryContainingMaterials?.tons),
          Cell(value: totalOtherMaterials?.mercuryContainingMaterials?.notes),
        ], height: 40),
        Row(cells: [
          Cell(value: '17 09 02*'),
          Cell(
              value:
                  'rakentamisessa ja purkamisessa syntyvät jätteet, jotka sisältävät PCB:tä (kuten PCB:tä sisältävät tiivistysmassat, PCB:tä sisältävät hartsipohjaiset lattiapäällysteet, PCB:tä sisältävät umpiolasit ja PCB:tä sisältävät muuntajat'),
          Cell(
              value: totalOtherMaterials?.pcbContainingDemolitionWaste?.volume),
          Cell(value: totalOtherMaterials?.pcbContainingDemolitionWaste?.tons),
          Cell(value: totalOtherMaterials?.pcbContainingDemolitionWaste?.notes),
        ], height: 90),
        Row(cells: [
          Cell(value: '17 09 03*'),
          Cell(
              value:
                  'muut rakentamisessa ja purkamisessa syntyvät jätteet (sekalaiset jätteet mukaan luettuna), jotka sisältävät vaarallisia aineita'),
          Cell(
              value:
                  totalOtherMaterials?.otherHazardousDemolitionWaste?.volume),
          Cell(value: totalOtherMaterials?.otherHazardousDemolitionWaste?.tons),
          Cell(
              value: totalOtherMaterials?.otherHazardousDemolitionWaste?.notes),
        ], height: 45),
        Row(cells: [
          Cell(value: '17 09 04'),
          Cell(
              value:
                  'muut kuin nimikkeissä 17 09 01, 17 09 02 ja 17 09 03 mainitut rakentamisessa ja purkamisessa syntyvät sekalaiset jätteet'),
          Cell(value: totalOtherMaterials?.otherDemolitionWaste?.volume),
          Cell(value: totalOtherMaterials?.otherDemolitionWaste?.tons),
          Cell(value: totalOtherMaterials?.otherDemolitionWaste?.notes),
        ], height: 45),
      ]),
    ]);
  }
}

void main() {
  final File file = File('C:\\Users\\Hannu Korvala\\test.xlsx');
  file.createSync();
  TestUtils.sampleWasteLawReportExporter.writeAsExcelSync(file);
}
