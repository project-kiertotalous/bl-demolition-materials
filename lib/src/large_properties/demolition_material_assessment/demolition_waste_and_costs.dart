import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/waste_cost_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'demolition_waste_and_costs.freezed.dart';

/// Purkujätteet ja kustannukset
@freezed
class DemolitionWasteAndCosts with _$DemolitionWasteAndCosts {
  DemolitionWasteAndCosts._();

  factory DemolitionWasteAndCosts(
      {ExcavationArea? excavationArea,
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
    demolitionCost: cleanSoilDemolitionCost
  );

  late final asphaltWaste = WasteCostItem(
      volume: excavationArea?.asphaltVolume,
      tons: excavationArea?.asphaltTons,
      demolitionCost: asphaltWasteDemolitionCost
  );

  late final cleanConcrete = WasteCostItem(
      volume: excavationArea?.asphaltVolume,
      tons: excavationArea?.asphaltTons,
      demolitionCost: asphaltWasteDemolitionCost
  );

  late final concreteBlocks = WasteCostItem(); // M37, F71, F72

  late final wallAndRoofTiles = WasteCostItem();

  late final ceramicTiles = WasteCostItem();

  late final rebarAndSteelScrap = WasteCostItem();

  late final stainlessSteel = WasteCostItem();

  late final copper = WasteCostItem();

  late final aluminum = WasteCostItem();

  late final cleanUsableWood = WasteCostItem();

  late final burnableWoodWaste = WasteCostItem();

  late final glass = WasteCostItem();

  late final glassAndMineralWool = WasteCostItem();

  late final fiberCementBoards = WasteCostItem();

  late final gypsumBoards = WasteCostItem();

  late final chipboard = WasteCostItem();

  late final windProtectionBoard = WasteCostItem();

  late final eWaste = WasteCostItem();

  late final plasticWaste = WasteCostItem();

  late final energyWaste = WasteCostItem();

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
}
