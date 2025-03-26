import 'dart:io';

import 'package:bl_demolition_materials/src/exporting/structures/exports.dart';
import 'package:bl_demolition_materials/src/exporting/structures/styles/exports.dart';
import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/items/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../large_properties/demolition_material_assessment/total/exports.dart';
import '../utils/test_utils.dart';
import 'report_exporters/excel_report_exporter.dart';
import 'report_exporters/pdf_report_exporter.dart';

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
        sheetName: 'Purkumateriaalien arviointilaskelma',
        columnWidths: [50, 9, 9, 9, 9, 9]);
    file.writeAsBytesSync(exporter.export().encode()!);
  }

  void writeAsPdfSync(File file) {
    final exporter =
        PDFReportExporter(_report, columnWidths: [50, 9, 9, 9, 9, 9]);
    exporter.export().save().then((val) => file.writeAsBytesSync(val));
  }

  ExportableReport get _report {
    final deWa = totalDemolitionWasteAndCosts;

    final reRy =
        deWa.totalReusableAndRecyclableMaterials;

    final reCo =
        deWa.totalRecyclableComponentsAndFurniture;

    final diHa =
        deWa.totalDisposalMaterialsAndHazardousWaste;

    return ExportableReport(tables: [
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(
              value: 'HYÖDYNTÄMISKELPOISET JA KIERRÄTETTÄVÄT MATERIAALIT',
              textStyle: TextStyle.bold),
          ReportCell(value: 'Tilavuus (m3)', textStyle: TextStyle.bold),
          ReportCell(value: 'Määrä-arvio (tonnia)', textStyle: TextStyle.bold),
          ReportCell(
              value: 'Purkukustannus (€/kpl tai €/tonni)',
              textStyle: TextStyle.bold),
          ReportCell(
              value: 'Materiaalierän hinta (€)', textStyle: TextStyle.bold),
        ]),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.cleanSoil, 'Maa-ainekset, puhdas maa')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.asphaltWaste, 'Asfalttijäte')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.cleanConcrete, 'Puhdas betoni')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.rebarAndSteelScrap,
                'Betoniteräkset, peltikatto ja muu teräs ja rautaromu')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.concreteBlocks, 'Betoniharkot')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.wallAndRoofTiles, 'Seinä- ja kattotiilet')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.ceramicTiles,
                'Kaakelilaatat ja keramiikka, ei sisällä asbestia')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.cleanUsableWood, 'Puhdas käyttökelpoinen puu')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.eWaste, 'Sähkö- ja elektroniikkaromu')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.stainlessSteel, 'Ruostumaton teräs')),
        ReportTableRow(cells: _wasteCostItemToCells(reRy?.copper, 'Kupari')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.aluminium, 'Alumiini')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.glassAndMineralWool, 'Lasi- ja mineraalieristevilla')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.fiberCementBoards,
                'Mineriitti kate ja palonsuojalevyt, ei sisällä asbestia')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.gypsumBoards, 'Kipsilevyt (cyproc)')),
        ReportTableRow(cells: _wasteCostItemToCells(reRy?.glass, 'Lasi')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.energyWaste,
                'Energiajäte, maalattupuu, kattohuopa ja aluskate')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.combustibleWoodWaste, 'Polttokelpoinen puujäte')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.windProtectionBoard,
                'Tuulensuojalevyt (bituliitti tai vastaava)')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.chipboard, 'Lastulevy')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.plasticWaste, 'Muovijäte, styrox, kosteuseriste yms.')),
        ReportTableRow(cells: [
          ReportCell(value: 'Yhteensä'),
          ReportCell(value: reRy?.totalVolume),
          ReportCell(value: reRy?.totalTons),
          ReportCell(),
          ReportCell(value: reRy?.totalBatchPrice),
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(
              value: 'KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET',
              textStyle: TextStyle.bold),
          ReportCell(
              value: 'määrä (kpl, m, tai m2)', textStyle: TextStyle.bold),
          ReportCell(value: 'Tilavuus (m3)', textStyle: TextStyle.bold),
          ReportCell(value: 'yhteis-paino (tonnia)', textStyle: TextStyle.bold),
          ReportCell(
              value: 'Myynti-hinta (€/kpl tai €/tonni)',
              textStyle: TextStyle.bold),
          ReportCell(
              value: 'Materiaalierän hinta (€)', textStyle: TextStyle.bold),
        ]),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteFrameBeams, 'Betonipalkit, runko')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteHollowSlabs, 'Betoniset ontelolaatat')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteRoofBeams, 'Betoniset kattopalkit')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteWallElements, 'Betoniset seinäelementit')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.glulamBeams, 'Liimapalkit')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.floorSupportWoodenBeams,
                'Puupalkit (kantavat lattiapalkit)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelFrameBeams, 'Teräspalkit, runkopalkit')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.rainGuttersAndDownspouts,
                'Sadevesikourut ja rännit (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.fireLaddersAndWalkways,
                'Palotikkaat ja kulkusillat (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.woodenRoofTrusses, 'Puiset kattoristikot')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelRoofTrusses, 'Teräksiset kattoristikot')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelChainLinkFence, 'Teräsverkko aita (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.aluminumChainLinkFence, 'Alumiiniverkko aita (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.woodAndFiberboardDoors, 'Puuovet ja kuitulevyovet')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.aluminumDoors, 'Alumiiniovet')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.exteriorAndFireExitSteelDoors,
                'Teräsovet (ulko ja palo-ovet)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.woodenOrBoardCabinetsAndFurniture,
                'Kaapit ja kalusteet, puu tai levy (keittiö ja sosiaalitilat)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelLockerCabinets, 'Teräksiset pukukaapit')),
        ReportTableRow(
            cells:
                _recyclableItemToCells(reCo?.woodenWindows, 'Puuiset ikkunat')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.porcelainToilets, 'WC-istuin, posliini')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.porcelainSinks, 'Pesuallas, posliini')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.stainlessSteelSinksAndTables,
                'Teräsaltaat ja pöydät (ruostumaton)')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.saunaStoves, 'Saunankiukaat')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.electricStoves, 'Sähköliedet')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.industrialElectricStoves, 'Suurtalous sähköliedet')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.refrigerators, 'Jääkaapit')),
        ReportTableRow(
            cells:
                _recyclableItemToCells(reCo?.coldRoomCabinets, 'Kylmiökaapit')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.electricRadiators, 'Lämpöpatterit, sähkö')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.smallElectricalAccumulators, 'Vesivaraajat, pienet')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.largeElectricalAccumulators, 'Vesivaraajat, suuret')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.electricMotorsAndCirculationPumps,
                'Sähkömoottorit ja kiertovesipumput')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.ventilationUnits, 'Ilmanvaihtokoneet')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.electricalDistributionCabinetsAndMeters,
                'Sähkökaapit ja mittarit')),
        ReportTableRow(
            cells:
                _recyclableItemToCells(reCo?.roofExhaustFans, 'Huippuimurit')),
        ReportTableRow(cells: [
          ReportCell(value: 'Yhteensä'),
          ReportCell(),
          ReportCell(value: reCo?.totalVolume),
          ReportCell(value: reCo?.totalTons),
          ReportCell(),
          ReportCell(value: reCo?.totalBatchPrice),
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(
              value: 'Loppusijoitettavat materiaalit ja ongelmajätteet',
              textStyle: TextStyle.bold),
          ReportCell(value: 'Tilavuus (m3)', textStyle: TextStyle.bold),
          ReportCell(value: 'Määrä-arvio (tonnia)', textStyle: TextStyle.bold),
          ReportCell(
              value: 'Purku- ja käsittelykustannus (€/tonni)',
              textStyle: TextStyle.bold),
          ReportCell(
              value: 'Materiaalierän hinta (€)', textStyle: TextStyle.bold),
        ]),
        ReportTableRow(
            cells: _wasteItemToCells(
                diHa?.nonRecyclableBrickWaste, 'Kierrätyskelvoton tiilijäte')),
        ReportTableRow(
            cells: _wasteItemToCells(diHa?.contaminatedSoil, 'Saastunut maa')),
        ReportTableRow(
            cells: _wasteItemToCells(diHa?.asbestosOrBCPConcrete,
                'Asbestia tai BCP maalia sisältävä betoni (bitumi ja akryylipinnoitettu)')),
        ReportTableRow(cells: _wasteItemToCells(diHa?.bitumen, 'Bitumi')),
        ReportTableRow(
            cells: _wasteItemToCells(diHa?.otherAsbestosContainingMaterial,
                'Mineriitti, tiilet, tiilikate, kattohuopa, kaakelilaatat yms. sisältää asbestia')),
        ReportTableRow(cells: [
          ReportCell(value: 'Yhteensä'),
          ReportCell(value: diHa?.totalVolume),
          ReportCell(value: diHa?.totalTons),
          ReportCell(),
          ReportCell(value: diHa?.totalBatchPrice),
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(
              value: 'Purkujätteet ja kustannukset',
              textStyle: TextStyle.bold),
          ReportCell(value: 'Tilavuus (m3)', textStyle: TextStyle.bold),
          ReportCell(value: 'Määrä-arvio (tonnia)', textStyle: TextStyle.bold),
        ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Kokonaispurkujätemäärä'),
              ReportCell(value: deWa.totalVolume),
              ReportCell(value: deWa.totalTons)
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Rakennuksen purkujätemäärä (ei sisällä poistettavaa maata)'),
              ReportCell(value: deWa.totalVolumeExcludingExcavatedLand),
              ReportCell(value: deWa.totalTonsExcludingExcavatedLand)
            ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purettavan rakennuksen kerrosala (m2)'),
              ReportCell(value: deWa.buildingGrossFloorArea),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purettavan rakennuksen tilavuus (m3)'),
              ReportCell(value: deWa.buildingVolume),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purkukustanuksen hinta (€/tonni)'),
              ReportCell(value: deWa.demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purkumateriaalien mukaan laskettu purkukustannus (€/tonni)'),
              ReportCell(value: deWa.demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purkukustanus arvio (€)'),
              ReportCell(value: deWa.estimatedDemolitionCost),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Rakennuksen purkustannus (ei sisällä maanpoistoa)'),
              ReportCell(value: deWa.estimatedDemolitionCostExcludingExcavations),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purkukustannus/neliö (€/m2)'),
              ReportCell(value: deWa.demolitionCostPerSquareMeter),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purkukustannus/neliö, ei sisällä maanpoistoa (€/m2)'),
              ReportCell(value: deWa.demolitionCostPerSquareMeterExcludingExcavations),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purkukustannus/rakennuskuutio (€/m3)'),
              ReportCell(value: deWa.demolitionCostPerCubicMeter),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Purkukustannus/rakennuskuutio, ei sisällä maanpoistoa (€/m3)'),
              ReportCell(value: deWa.demolitionCostPerCubicMeterExcludingExcavations),
            ]),
        ReportTableRow(
            cells: [
              ReportCell(value: 'Myytävät materiaalierät (€)'),
              ReportCell(value: deWa.sellableMaterialBatchesPrice),
            ]),
      ])
    ]);
  }

  List<ReportCell> _wasteCostItemToCells(WasteCostItem? item, String title) {
    return [
      ReportCell(value: title),
      ReportCell(value: item?.volume),
      ReportCell(value: item?.tons),
      ReportCell(value: item?.demolitionCost),
      ReportCell(value: item?.batchPrice),
    ];
  }

  List<ReportCell> _recyclableItemToCells(RecyclableItem? item, String title) {
    return [
      ReportCell(value: title),
      ReportCell(value: item?.size),
      ReportCell(value: item?.volume),
      ReportCell(value: item?.tons),
      ReportCell(value: item?.unitPrice),
      ReportCell(value: item?.batchPrice),
    ];
  }

  List<ReportCell> _wasteItemToCells(WasteDisposalItem? item, String title) {
    return [
      ReportCell(value: title),
      ReportCell(value: item?.volume),
      ReportCell(value: item?.tons),
      ReportCell(value: item?.demolitionOrProcessingCost),
      ReportCell(value: item?.batchPrice),
    ];
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
