import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/waste_cost_item.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/fixtures_and_structures.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/machines_and_equipments.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_and_protective_structures.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/fixed_furniture.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/outer_doors.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../hvac_electrical_and_other_equipment/hvac_and_electrical_installations.dart';
import '../partition_walls_doors_and_windows/inner_doors.dart';
import '../partition_walls_doors_and_windows/room_spaces.dart';
import '../partition_walls_doors_and_windows/windows.dart';

part 'demolition_waste_and_costs.freezed.dart';

/// Purkujätteet ja kustannukset
@freezed
class DemolitionWasteAndCosts with _$DemolitionWasteAndCosts {
  DemolitionWasteAndCosts._();

  factory DemolitionWasteAndCosts(
      {ExcavationArea? excavationArea,
      Foundations? foundations,
      TotalIntermediateFloors? totalIntermediateFloors,
      TotalRoofs? totalRoofs,
      TotalBuildingFrame? totalBuildingFrame,
      OuterDoors? outerDoors,
      InnerDoors? innerDoors,
      FixedFurniture? fixedFurniture,
      Cellar? cellar,
      FloorStructures? floorStructures,
      RoomSpaces? roomSpaces,
      Windows? windows,
      HvacAndElectricalInstallations? hvacAndElectricalInstallations,
      MachinesAndEquipments? machinesAndEquipments,
      FixturesAndStructures? fixturesAndStructures,
      YardAndProtectiveStructures? yardAndProtectiveStructures,
      num? cleanSoilDemolitionCost,
      num? asphaltWasteDemolitionCost,
      num? cleanConcreteDemolitionCost,
      num? concreteBlocksDemolitionCost,
      num? wallAndRoofTilesDemolitionCost,
      num? ceramicTilesDemolitionCost,
      num? rebarAndSteelScrapDemolitionCost,
      num? stainlessSteelDemolitionCost,
      num? copperDemolitionCost,
      num? aluminiumDemolitionCost,
      num? cleanUsableWoodDemolitionCost,
      num? combustibleWoodWasteDemolitionCost,
      num? glassDemolitionCost,
      num? glassAndMineralWoolDemolitionCost,
      num? fiberCementBoardsDemolitionCost,
      num? gypsumBoardsDemolitionCost,
      num? chipboardDemolitionCost,
      num? windProtectionBoardDemolitionCost,
      num? eWasteDemolitionCost,
      num? plasticWasteDemolitionCost,
      num? energyWasteDemolitionCost}) = _DemolitionWasteAndCosts;

  // Maa-ainekset, puhdas maa
  late final cleanSoil = WasteCostItem(
      volume: excavationArea?.volumeToRemove,
      tons: excavationArea?.cleanLandTons,
      demolitionCost: cleanSoilDemolitionCost);

  // Asfalttijäte
  late final asphaltWaste = WasteCostItem(
      volume: excavationArea?.asphaltVolume,
      tons: excavationArea?.asphaltTons,
      demolitionCost: asphaltWasteDemolitionCost);

  // Puhdas betoni
  late final cleanConcrete = WasteCostItem(
      volume: _cleanConcreteVolume,
      tons: _cleanConcreteTons,
      demolitionCost: cleanConcreteDemolitionCost);

  // Betoniharkot
  late final concreteBlocks = WasteCostItem(
      volume: foundations?.concreteBlockVolume,
      tons: foundations?.concreteTons,
      demolitionCost: concreteBlocksDemolitionCost);

  // Seinä- ja kattotiilet
  late final wallAndRoofTiles = WasteCostItem(
      volume: Utils.sumOrNull([
        totalRoofs?.roofTileVolume,
        totalBuildingFrame?.brickVolume,
        totalBuildingFrame?.limeOrRedBrickVolume,
        roomSpaces?.totalBrickWallsVolume
      ]),
      tons: Utils.sumOrNull([
        totalRoofs?.roofTileTons,
        totalBuildingFrame?.brickTons,
        totalBuildingFrame?.limeOrRedBrickTons,
        roomSpaces?.totalBrickWallsTons
      ]),
      demolitionCost: wallAndRoofTilesDemolitionCost);

  // Kaakelilaatat ja keramiikka, ei sisällä asbestia
  late final ceramicTiles = WasteCostItem(
      volume: _ceramicTileVolume,
      tons: _ceramicTileTons,
      demolitionCost: ceramicTilesDemolitionCost);

  // Betoniteräkset, peltikatto, ja muu teräs sekä rautaromu
  late final rebarAndSteelScrap = WasteCostItem(
      volume: null,
      tons: _rebarAndSteelScrapTons,
      demolitionCost: rebarAndSteelScrapDemolitionCost);

  // Ruostumaton teräs
  late final stainlessSteel = WasteCostItem(
      volume: null,
      tons: (fixedFurniture?.areFurnituresRecyclable ?? true)
          ? null
          : fixedFurniture?.stainlessSteelTons,
      demolitionCost: stainlessSteelDemolitionCost);

  // Kupari
  late final copper = WasteCostItem(
      volume: null,
      tons: Utils.sumOrNull([
        hvacAndElectricalInstallations?.copperElectricalWires?.tons,
        hvacAndElectricalInstallations?.copperWaterPipes?.tons
      ]),
      demolitionCost: copperDemolitionCost);

  // Alumiini
  late final aluminium = WasteCostItem(
      volume: null,
      tons: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? true)
            ? null
            : outerDoors?.totalAluminiumTons,
        (windows?.areWindowsRecyclable ?? true)
            ? null
            : windows?.totalAluminiumTons
      ]),
      demolitionCost: aluminiumDemolitionCost);

  // Puhdas käyttökelpoinen puu
  late final cleanUsableWood = WasteCostItem(
      volume: Utils.sumOrNull([
        totalIntermediateFloors?.woodFrameWoodVolume,
        totalBuildingFrame?.woodFramePart.woodVolume,
        roomSpaces?.totalWoodFramedWallsVolume
      ]),
      tons: Utils.sumOrNull([
        totalIntermediateFloors?.woodFrameWoodTons,
        totalBuildingFrame?.woodFramePart.woodTons,
        roomSpaces?.totalWoodFramedWallsTons,
        // TODO: Adding the tons of lime or red brick here seems sus, but is
        // according to spec. This smells, very stinky.
        totalBuildingFrame?.limeOrRedBrickTons
      ]),
      demolitionCost: cleanUsableWoodDemolitionCost);

  // Polttokelpoinen puujäte
  late final combustibleWoodWaste = WasteCostItem(
      volume: _combustibleWoodWasteVolume,
      tons: _combustibleWoodWasteTons,
      demolitionCost: combustibleWoodWasteDemolitionCost);

  // Lasi
  late final glass = WasteCostItem(
      volume: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? true)
            ? null
            : outerDoors?.totalGlassVolume,
        (windows?.areWindowsRecyclable ?? true)
            ? null
            : windows?.totalGlassVolume,
        (innerDoors?.areDoorsRecyclable ?? true)
            ? null
            : innerDoors?.totalGlassVolume,
      ]),
      tons: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? true)
            ? null
            : outerDoors?.totalGlassTons,
        (windows?.areWindowsRecyclable ?? true)
            ? null
            : windows?.totalGlassTons,
        (innerDoors?.areDoorsRecyclable ?? true)
            ? null
            : innerDoors?.totalGlassTons,
      ]),
      demolitionCost: glassDemolitionCost);

  // Lasi- ja mineraalieristevilla
  late final glassAndMineralWool = WasteCostItem(
      volume: Utils.sumOrNull([
        // TODO: A loved child has many names? Would be nice to refactor the
        // naming schemes to be consistent.
        foundations?.mineralWoolVolume,
        foundations?.solidBoardingAndWoodFrameVolume,
        cellar?.glassAndMineralWoolInsulationVolume,
        totalRoofs?.insulationVolume,
        totalBuildingFrame?.mineralWoolInsulationVolume
      ]),
      tons: Utils.sumOrNull([
        foundations?.mineralWoolTons,
        foundations?.solidBoardingAndWoodFrameTons,
        cellar?.glassAndMineralWoolInsulationTons,
        totalRoofs?.insulationTons,
        totalBuildingFrame?.mineralWoolInsulationTons
      ]),
      demolitionCost: glassAndMineralWoolDemolitionCost);

  // Mineriitti kate ja palonsuojalevyt, ei sisällä asbestia
  late final fiberCementBoards = WasteCostItem(
      volume: Utils.sumOrNull([
        totalRoofs?.mineriteVolume,
        totalBuildingFrame?.mineriteBoardVolume
      ]),
      tons: Utils.sumOrNull(
          [totalRoofs?.mineriteTons, totalBuildingFrame?.mineriteBoardTons]),
      demolitionCost: fiberCementBoardsDemolitionCost);

  // Kipsilevyt
  late final gypsumBoards = WasteCostItem(
      volume: Utils.sumOrNull([
        floorStructures?.gypsumBoardingMidsoleVolume,
        totalBuildingFrame?.gypsumBoardVolume,
        roomSpaces?.totalCybrocVolume
      ]),
      tons: Utils.sumOrNull([
        floorStructures?.gypsumBoardingMidsoleTons,
        totalBuildingFrame?.gypsumBoardTons,
        roomSpaces?.totalCybrocTons
      ]),
      demolitionCost: gypsumBoardsDemolitionCost);

  // Lastulevy
  late final chipboard = WasteCostItem(
      volume: Utils.sumOrNull([
        floorStructures?.chipBoardMidsoleVolume,
        roomSpaces?.totalChipboardVolume
      ]),
      tons: Utils.sumOrNull([
        floorStructures?.chipBoardMidsoleTons,
        roomSpaces?.totalChipboardTons
      ]),
      demolitionCost: chipboardDemolitionCost);

  // Tuulensuojalevyt (bitulitti tai vastaava)
  late final windProtectionBoard = WasteCostItem(
      volume: totalBuildingFrame?.windProtectionBoardVolume,
      tons: totalBuildingFrame?.windProtectionBoardTons,
      demolitionCost: windProtectionBoardDemolitionCost);

  // Sähkö- ja elektroniikkarokuma
  late final eWaste = WasteCostItem(
      volume: null,
      tons: Utils.sumOrNull([
        (fixedFurniture?.areFurnituresRecyclable ?? true)
            ? null
            : fixedFurniture?.electricScrapTons,
        (machinesAndEquipments?.machinesRecyclable ?? true)
            ? null
            : Utils.sumOrNull([
                machinesAndEquipments?.smallElectricalAccumulators?.tons,
                machinesAndEquipments?.largeElectricalAccumulators?.tons,
                machinesAndEquipments?.electricRadiators?.tons,
                machinesAndEquipments?.ventilationUnits?.tons,
                machinesAndEquipments
                    ?.electricalDistributionCabinetsAndMeters?.tons,
                machinesAndEquipments?.electricMotorsAndCirculationPumps?.tons,
                machinesAndEquipments?.roofExhaustFans?.tons
              ])
      ]),
      demolitionCost: eWasteDemolitionCost);

  // Muovijäte, styrox, kosteuseriste yms.
  late final plasticWaste = WasteCostItem(
      volume: Utils.sumOrNull([
        foundations?.plasticWasteVolume,
        cellar?.plasticWasteVolume,
        floorStructures?.plasticCarpetOrPlasticTileFloorVolume,
        totalBuildingFrame?.styrofoamVolume,
        hvacAndElectricalInstallations?.plasticSewagePipes?.volume,
        hvacAndElectricalInstallations?.plasticWaterPipes?.volume,
        roomSpaces?.totalPaintedPlasteredBrickWallVolume,
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? true)
            ? null
            : roomSpaces?.totalPlasticCarpetVolume
      ]),
      tons: Utils.sumOrNull([
        foundations?.plasticWasteTons,
        cellar?.plasticWasteTons,
        floorStructures?.plasticCarpetOrPlasticTileFloorTons,
        totalBuildingFrame?.styrofoamTons,
        hvacAndElectricalInstallations?.plasticSewagePipes?.tons,
        hvacAndElectricalInstallations?.plasticWaterPipes?.tons,
        roomSpaces?.totalPaintedPlasteredBrickWallTons,
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? true)
            ? null
            : roomSpaces?.totalPlasticCarpetTons
      ]),
      demolitionCost: plasticWasteDemolitionCost);

  // Energiajäte, maalattupuu, kattohuopa, ja aluskate
  late final energyWaste = WasteCostItem(
      volume: Utils.sumOrNull([
        foundations?.combustibleWasteVolume,
        // TODO: Floor panel is taken into consideration when calculating volume,
        // but not when calculating tons. Smells fishy.
        floorStructures?.floorPanelFloorVolume,
        floorStructures?.parquetFloorVolume,
        totalRoofs?.underlayVolume,
        totalRoofs?.bitumenVolume,
        totalBuildingFrame?.exteriorWoodCladdingVolume,
        (outerDoors?.areDoorsRecyclable ?? true)
            ? null
            : outerDoors?.totalWoodVolume,
        (windows?.areWindowsRecyclable ?? true)
            ? null
            : windows?.totalWoodenVolume,
        (innerDoors?.areDoorsRecyclable ?? true)
            ? null
            : innerDoors?.totalWoodVolume
      ]),
      tons: Utils.sumOrNull([
        foundations?.combustibleWasteTons,
        floorStructures?.parquetFloorTons,
        totalRoofs?.underlayTons,
        totalRoofs?.bitumenTons,
        totalBuildingFrame?.exteriorWoodCladdingTons,
        (outerDoors?.areDoorsRecyclable ?? true)
            ? null
            : outerDoors?.totalWoodTons,
        (windows?.areWindowsRecyclable ?? true) ? null : windows?.totalWoodTons,
        (innerDoors?.areDoorsRecyclable ?? true)
            ? null
            : innerDoors?.totalWoodTons
      ]),
      demolitionCost: energyWasteDemolitionCost);

  List<WasteCostItem> get all => [
        cleanSoil,
        asphaltWaste,
        cleanConcrete,
        concreteBlocks,
        wallAndRoofTiles,
        ceramicTiles,
        rebarAndSteelScrap,
        stainlessSteel,
        copper,
        aluminium,
        cleanUsableWood,
        combustibleWoodWaste,
        glass,
        glassAndMineralWool,
        fiberCementBoards,
        gypsumBoards,
        chipboard,
        windProtectionBoard,
        eWaste,
        plasticWaste,
        energyWaste
      ];

  num? get totalVolume =>
      all.fold<num>(0, (acc, element) => acc + (element.volume ?? 0));

  num? get totalTons =>
      all.fold<num>(0, (acc, element) => acc + (element.tons ?? 0));

  num? get totalMaterialCost => all.fold<num>(
      0, (acc, element) => acc + (element.totalMaterialCost ?? 0));

  num? get _cleanConcreteVolume => Utils.sumOrNull([
        _foundationsCleanConcreteVolume,
        _intermediateFloorsCleanConcreteVolume,
        _roofsCleanConcreteVolume,
        roomSpaces?.totalConcreteElementOrCastingWallsVolume,
        _buildingFrameCleanConcreteVolume
      ]);

  num? get _foundationsCleanConcreteVolume {
    if (foundations == null) {
      return null;
    }

    if (foundations!.bituminousWaterProofing) {
      return 0;
    }

    return Utils.sumOrNull([
      foundations!.concreteVolume,
      foundations!.concreteTons,
      foundations!.rebarTons,
      foundations!.concreteBlockTons,
      foundations!.concreteBlockVolume
    ]);
  }

  num? get _buildingFrameCleanConcreteVolume {
    if (totalBuildingFrame?.buildingFrame == null) {
      return null;
    }

    if (!totalBuildingFrame!.buildingFrame!.areMaterialsRecyclable) {
      return totalBuildingFrame!.plasterCoatingVolume;
    }

    return Utils.sumOrNull([
      totalBuildingFrame!.plasterCoatingVolume,
      totalBuildingFrame!.concreteVerticalColumnsPart.concreteVolume,
      totalBuildingFrame!
          .concreteElementWallsWithoutFrameworkPart.concreteVolume
    ]);
  }

  num? get _intermediateFloorsCleanConcreteVolume {
    if (totalIntermediateFloors == null) {
      return null;
    }

    if (totalIntermediateFloors!.hollowCoreSlabsAndGlulamBeamRecyclable! ==
        false) {
      return totalIntermediateFloors!.concreteCastingConcreteVolume!;
    }

    return Utils.sumOrNull([
      totalIntermediateFloors!.concreteCastingConcreteVolume,
      totalIntermediateFloors!.hollowCoreSlabConcreteVolume
    ]);
  }

  num? get _roofsCleanConcreteVolume {
    if (totalRoofs?.roofTrussesAreRecyclable == null) {
      return null;
    }

    if (totalRoofs!.roofTrussesAreRecyclable!) {
      return 0;
    }

    return totalRoofs?.concreteVolume;
  }

  num? get _cleanConcreteTons => Utils.sumOrNull([
        _foundationsCleanConcreteTons,
        _intermediateFloorsCleanConcreteTons,
        _roofsCleanConcreteTons,
        roomSpaces?.totalConcreteElementOrCastingWallsTons,
        _buildingFrameCleanConcreteTons
      ]);

  num? get _foundationsCleanConcreteTons {
    if (foundations == null) {
      return null;
    }

    if (foundations!.bituminousWaterProofing) {
      return 0;
    }

    return foundations!.concreteTons;
  }

  num? get _intermediateFloorsCleanConcreteTons {
    if (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ==
        null) {
      return null;
    }

    if (!totalIntermediateFloors!.hollowCoreSlabsAndGlulamBeamRecyclable!) {
      return totalIntermediateFloors?.concreteCastingConcreteTons;
    }

    return Utils.sumOrNull([
      totalIntermediateFloors?.concreteCastingConcreteTons,
      totalIntermediateFloors?.hollowCoreSlabConcreteTons
    ]);
  }

  num? get _roofsCleanConcreteTons {
    if (totalRoofs?.roofTrussesAreRecyclable == null) {
      return null;
    }

    if (totalRoofs!.roofTrussesAreRecyclable!) {
      return 0;
    }

    return totalRoofs!.concreteTons;
  }

  num? get _buildingFrameCleanConcreteTons {
    if (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable == null) {
      return null;
    }

    if (totalBuildingFrame!.buildingFrame!.areMaterialsRecyclable) {
      return totalBuildingFrame!.plasterCoatingTons;
    }

    // TODO: Adding concreteVolume here seems suspicious, but is according to spec.
    return Utils.sumOrNull([
      totalBuildingFrame?.plasterCoatingTons,
      totalBuildingFrame
          ?.concreteElementWallsWithoutFrameworkPart.concreteVolume,
      totalBuildingFrame?.concreteVerticalColumnsPart.concreteTons
    ]);
  }

  num? get _ceramicTileVolume {
    if (Utils.allNull([floorStructures, roomSpaces])) {
      return null;
    }

    final floorsCeramicTileVolume =
        (floorStructures?.surfaceMaterialCoatingContainsAsbestos ?? true)
            ? null
            : floorStructures!.ceramicTileFloorVolume;

    final wallsCeramicTileVolume =
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? true)
            ? null
            : roomSpaces!.totalCeramicTileWallsVolume;

    return Utils.sumOrNull([floorsCeramicTileVolume, wallsCeramicTileVolume]);
  }

  num? get _ceramicTileTons {
    if (Utils.allNull([floorStructures, roomSpaces])) {
      return null;
    }

    final floorsCeramicTileTons =
        (floorStructures?.surfaceMaterialCoatingContainsAsbestos ?? true)
            ? null
            : floorStructures!.ceramicTileFloorTons;

    final wallsCeramicTileTons =
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? true)
            ? null
            : roomSpaces!.totalCeramicTileWallsTons;

    return Utils.sumOrNull([floorsCeramicTileTons, wallsCeramicTileTons]);
  }

  num? get _rebarAndSteelScrapTons => Utils.sumOrNull([
        _rebarAndSteelScrapOuterShellAndExternalStructuresTons,
        _rebarAndSteelScrapRoomSpacesTons,
        _rebarAndSteelScrapHvacElectricalAndOtherEquipmentTons
      ]);

  num? get _rebarAndSteelScrapOuterShellAndExternalStructuresTons =>
      Utils.sumOrNull([
        foundations?.rebarTons,
        cellar?.rebarTons,
        totalIntermediateFloors?.concreteCastingRebarTons,
        (totalRoofs?.roofs?.roofTrussesAreRecyclable ?? true)
            ? null
            : totalRoofs?.rebarTons,
        (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? true)
            ? null
            : totalBuildingFrame?.steelVerticalColumnsPart.steelTons
      ]);

  num? get _rebarAndSteelScrapRoomSpacesTons => Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? true)
            ? null
            : outerDoors?.totalSteelTons,
        (innerDoors?.areDoorsRecyclable ?? true)
            ? null
            : innerDoors?.totalSteelTons,
        (fixedFurniture?.areFurnituresRecyclable ?? true)
            ? null
            : fixedFurniture?.steelTons
      ]);

  num? get _rebarAndSteelScrapHvacElectricalAndOtherEquipmentTons =>
      Utils.sumOrNull([
        hvacAndElectricalInstallations?.centralHeatingPipes?.tons,
        hvacAndElectricalInstallations?.castIronSewagePipes?.tons,
        hvacAndElectricalInstallations?.steelVentilationPipes300Dn?.tons,
        hvacAndElectricalInstallations?.steelVentilationPipes500Dn?.tons,
        machinesAndEquipments?.waterCirculatedRadiators?.tons,
        yardAndProtectiveStructures?.concretePavingSlabs?.tons,
        yardAndProtectiveStructures?.dripTraysAndProtectiveMetalSheets?.tons,
        // TODO: waterCirculatedRadiators is added twice here. This is according
        // to spec, but very much smells.
        (machinesAndEquipments?.machinesRecyclable ?? true)
            ? null
            : machinesAndEquipments?.waterCirculatedRadiators?.tons,
        (fixturesAndStructures?.fixturesRecyclable ?? true)
            ? null
            : Utils.sumOrNull([
                fixturesAndStructures?.rainGuttersAndDownSpouts?.tons,
                fixturesAndStructures?.fireLaddersAndWalkways?.tons,
                fixturesAndStructures?.aluminiumChainLinkFences?.tons,
                fixturesAndStructures?.steelChainLinkFences?.tons
              ])
      ]);

  num? get _combustibleWoodWasteVolume => Utils.sumOrNull([
        foundations?.woodShavingsVolume,
        (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
                false)
            ? null
            : totalIntermediateFloors?.glulamBeamWoodVolume,
        floorStructures?.solidBoardingMidsoleVolume,
        (totalRoofs?.roofTrussesAreRecyclable ?? true)
            ? null
            : totalRoofs?.woodVolume,
        totalBuildingFrame?.semiHardFiberBoardVolume,
        (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? true)
            ? null
            : totalBuildingFrame?.glulamBeamsPart.woodVolume,
        roomSpaces?.totalBoardPanelVolume
      ]);

  num? get _combustibleWoodWasteTons => Utils.sumOrNull([
        foundations?.woodShavingsTons,
        (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
                false)
            ? null
            : totalIntermediateFloors?.glulamBeamWoodTons,
        floorStructures?.solidBoardingMidsoleTons,
        // TODO: While floor panel tons are added here, #_combustibleWoodWasteVolume
        // does not add floorStructures?.floorPanelFloorVolume -> seems fishy.
        floorStructures?.floorPanelFloorTons,
        (totalRoofs?.roofTrussesAreRecyclable ?? true)
            ? null
            : totalRoofs?.woodTons,
        (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? true)
            ? null
            : totalBuildingFrame?.glulamBeamsPart.woodTons,
        totalBuildingFrame?.semiHardFiberBoardTons,
        roomSpaces?.totalBoardPanelTons
      ]);
}
