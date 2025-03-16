import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/waste_cost_item.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../partition_walls_doors_and_windows/room_spaces.dart';

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
      RoomSpaces? roomSpaces,
      num? cleanSoilDemolitionCost,
      num? asphaltWasteDemolitionCost,
      num? cleanConcreteDemolitionCost,
      num? concreteBlocksDemolitionCost,
      num? wallAndRoofTilesDemolitionCost,
      num? ceramicTilesDemolitionCost,
      num? rebarAndSteelScrapDemolitionCost,
      num? stainlessSteelDemolitionCost,
      num? copperDemolitionCost,
      num? aluminumDemolitionCost,
      num? cleanUsableWoodDemolitionCost,
      num? burnableWoodWasteDemolitionCost,
      num? glassDemolitionCost,
      num? glassAndMineralWoolDemolitionCost,
      num? fiberCementBoardsDemolitionCost,
      num? gypsumBoardsDemolitionCost,
      num? chipboardDemolitionCost,
      num? windProtectionBoardDemolitionCost,
      num? eWasteDemolitionCost,
      num? plasticWasteDemolitionCost,
      num? energyWasteDemolitionCost}) = _DemolitionWasteAndCosts;

  late final cleanSoil = WasteCostItem(
      volume: excavationArea?.volumeToRemove,
      tons: excavationArea?.cleanLandTons,
      demolitionCost: cleanSoilDemolitionCost);

  late final asphaltWaste = WasteCostItem(
      volume: excavationArea?.asphaltVolume,
      tons: excavationArea?.asphaltTons,
      demolitionCost: asphaltWasteDemolitionCost);

  late final cleanConcrete = WasteCostItem(
      volume: excavationArea?.asphaltVolume,
      tons: excavationArea?.asphaltTons,
      demolitionCost: asphaltWasteDemolitionCost);

  late final concreteBlocks = WasteCostItem(
      volume: _concreteBlocksVolume,
      tons: _concreteBlocksTons,
      demolitionCost: concreteBlocksDemolitionCost);

  late final wallAndRoofTiles = WasteCostItem(); // TODO

  late final ceramicTiles = WasteCostItem(); // TODO

  late final rebarAndSteelScrap = WasteCostItem(); // TODO

  late final stainlessSteel = WasteCostItem(); // TODO

  late final copper = WasteCostItem(); // TODO

  late final aluminum = WasteCostItem(); // TODO

  late final cleanUsableWood = WasteCostItem(); // TODO

  late final burnableWoodWaste = WasteCostItem(); // TODO

  late final glass = WasteCostItem(); // TODO

  late final glassAndMineralWool = WasteCostItem(); // TODO

  late final fiberCementBoards = WasteCostItem(); // TODO

  late final gypsumBoards = WasteCostItem(); // TODO

  late final chipboard = WasteCostItem(); // TODO

  late final windProtectionBoard = WasteCostItem(); // TODO

  late final eWaste = WasteCostItem(); // TODO

  late final plasticWaste = WasteCostItem(); // TODO

  late final energyWaste = WasteCostItem(); // TODO

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
        aluminum,
        cleanUsableWood,
        burnableWoodWaste,
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

  num? get volume =>
      all.fold<num>(0, (acc, element) => acc + (element.volume ?? 0));

  num? get tons =>
      all.fold<num>(0, (acc, element) => acc + (element.tons ?? 0));

  num? get totalMaterialCost => all.fold<num>(
      0, (acc, element) => acc + (element.totalMaterialCost ?? 0));

  num? get _concreteBlocksVolume => Utils.sumOrNull([
        _foundationsConcreteVolume,
        _intermediateFloorsConcreteVolume,
        _roofsConcreteVolume,
        roomSpaces?.totalConcreteElementOrCastingWallsMaterialVolume,
        _buildingFrameConcreteVolume
      ]);

  num? get _foundationsConcreteVolume {
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

  num? get _buildingFrameConcreteVolume {
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

  num? get _intermediateFloorsConcreteVolume {
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

  num? get _roofsConcreteVolume {
    if (totalRoofs?.roofTrussesAreRecyclable == null) {
      return null;
    }

    if (totalRoofs!.roofTrussesAreRecyclable!) {
      return 0;
    }

    return totalRoofs?.concreteVolume;
  }

  num? get _concreteBlocksTons => Utils.sumOrNull([
        _foundationsConcreteTonsTotal,
        _intermediateFloorsConcreteTons,
        _roofsConcreteTons,
        roomSpaces?.totalConcreteElementOrCastingWallsMaterialTons,
        _buildingFrameConcreteTons
      ]);

  num? get _foundationsConcreteTonsTotal {
    if (foundations == null) {
      return null;
    }

    if (foundations!.bituminousWaterProofing) {
      return 0;
    }

    return foundations!.concreteTons;
  }

  num? get _intermediateFloorsConcreteTons {
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

  num? get _roofsConcreteTons {
    if (totalRoofs?.roofTrussesAreRecyclable == null) {
      return null;
    }

    if (totalRoofs!.roofTrussesAreRecyclable!) {
      return 0;
    }

    return totalRoofs!.concreteTons;
  }

  num? get _buildingFrameConcreteTons {
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
}
