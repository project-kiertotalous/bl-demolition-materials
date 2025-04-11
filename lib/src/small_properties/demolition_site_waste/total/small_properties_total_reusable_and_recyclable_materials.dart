import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../apartments/exports.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../quantities_to_material_form/quantities_to_material_form.dart';
import '../../yard_buildings_and_structures/exports.dart';
import '../items/exports.dart';

part 'small_properties_total_reusable_and_recyclable_materials.freezed.dart';

/// HYÖDYNTÄMISKELPOISET JA KIERRÄTETTÄVÄT MATERIAALIT
@freezed
abstract class SmallPropertiesTotalReusableAndRecyclableMaterials
    with _$SmallPropertiesTotalReusableAndRecyclableMaterials {
  SmallPropertiesTotalReusableAndRecyclableMaterials._();

  factory SmallPropertiesTotalReusableAndRecyclableMaterials(
          {Apartment? apartment,
          ApartmentFloorMaterials? apartmentFloorMaterials,
          ApartmentSize? apartmentSize,
          ApartmentWallMaterials? apartmentWallMaterials,
          Apartments? apartments,
          CarportOrGarage? carportOrGarage,
          Counter? counter,
          DressingClosets? dressingClosets,
          ElectricStoves? electricStoves,
          HallDoors? hallDoors,
          Hvac? hvac,
          KitchenBathroomAndToiletWallsAndFloors?
              kitchenBathroomAndToiletWallsAndFloors,
          KitchenClosets? kitchenClosets,
          MachineryEquipmentAndFixedStructures?
              machineryEquipmentAndFixedStructures,
          PassageDoors? passageDoors,
          PorcelainSeats? porcelainSeats,
          Refrigerators? refrigerators,
          Roof? roof,
          SaunaStoves? saunaStoves,
          SaunaWallPanels? saunaWallPanels,
          SmallPropertiesExcavationArea? smallPropertiesExcavationArea,
          SmallPropertiesFoundation? foundation,
          SmallPropertiesTotalReusableAndRecyclableMaterials?
              reusableAndRecyclableMaterials,
          SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo,
          SmallPropertyInnerDoors? innerDoors,
          SmallPropertyOuterDoors? outerDoors,
          SmallPropertyWindows? windows,
          SteelTableAndSinks? steelTablesAndSinks,
          ThermalCenter? thermalCenter,
          Walls? walls,
          WashingSinks? washingSinks,
          WaterAccumulators? waterAccumulators,
          YardRoof? yardRoof}) =
      _SmallPropertiesTotalReusableAndRecyclableMaterials;

  /// Maa-ainekset
  late final cleanSoil = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: Utils.multiplyOrZero([
        smallPropertiesExcavationArea?.soilToBeRemovedTons,
        smallPropertiesExcavationArea?.removableCleanSoilInPercents
      ]),
      handlingAndDismantlingCost: 6,
      materialValue: 0);

  /// Asfalttijäte
  late final asphaltWaste = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: Utils.sumOrNull([
        smallPropertiesExcavationArea?.asphaltTons,
        carportOrGarage?.asphaltTons
      ]),
      handlingAndDismantlingCost: 6,
      materialValue: 0);

  /// Puhdas betoni
  late final cleanConcrete = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.cleanConcrete,
      handlingAndDismantlingCost: 6,
      materialValue: 0);

  /// Betoniteräkset, peltikatto ja muu
  late final steel = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.steel,
      handlingAndDismantlingCost: 10,
      materialValue: 40);

  /// Seinä- ja kattotiilet
  late final wallAndRoofTiles = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.wallAndRoofTiles,
      handlingAndDismantlingCost: 6,
      materialValue: 0);

  /// Puhdas käyttökelpoinen puu
  late final cleanUsableWood = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.cleanWood,
      handlingAndDismantlingCost: 6,
      materialValue: 3);

  /// Polttokelpoinen puujäte
  late final combustibleWoodWaste = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.burnableWood,
      handlingAndDismantlingCost: 6,
      materialValue: 3);

  /// Tuulensuojalevyt (bitulitti tai vastaava)
  late final windProtectionBoard = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.windProtectionPlates,
      handlingAndDismantlingCost: 10,
      materialValue: 0.5);

  /// Lasi- ja mineraalieristevilla
  late final glassAndMineralWool = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.glassAndMineralInsulation,
      handlingAndDismantlingCost: 10,
      materialValue: 0);

  /// Kipsilevyt
  late final gypsumBoards = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.plasterBoardTons,
      handlingAndDismantlingCost: 10,
      materialValue: 0);

  /// Lastulevy
  late final chipboard = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.chipboardTons,
      handlingAndDismantlingCost: 10,
      materialValue: 0.5);

  /// Energiajäte, maalattupuu, kattohuopa, ja aluskate
  late final energyWaste = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.energyWaste,
      handlingAndDismantlingCost: 6,
      materialValue: 0.5);

  /// Lasi
  late final glass = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.glass,
      handlingAndDismantlingCost: 10,
      materialValue: 0);

  /// Alumiini
  late final aluminium = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.aluminium,
      handlingAndDismantlingCost: 10,
      materialValue: 40);

  /// Muu metalliromu, sähkökaapit, liedet, jääkaapit yms.
  late final rebarAndSteelScrap = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.otherMetalScrap,
      handlingAndDismantlingCost: 10,
      materialValue: 45);

  /// Ruostumaton teräs
  late final stainlessSteel = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.stainlessSteel,
      handlingAndDismantlingCost: 10,
      materialValue: 650);

  /// Kupari
  late final copper = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.copper,
      handlingAndDismantlingCost: 11,
      materialValue: 1300);

  /// Betoniset pihalaatat ja muurikivet
  late final concreteBlocks = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.recyclableYardTilesAndStones,
      handlingAndDismantlingCost: 6,
      materialValue: 3);

  List<SmallPropertiesRecyclableMaterialItem> get all => [
        cleanSoil,
        asphaltWaste,
        cleanConcrete,
        steel,
        wallAndRoofTiles,
        cleanUsableWood,
        combustibleWoodWaste,
        windProtectionBoard,
        glassAndMineralWool,
        gypsumBoards,
        chipboard,
        energyWaste,
        glass,
        aluminium,
        rebarAndSteelScrap,
        stainlessSteel,
        copper,
        concreteBlocks
      ];

  num? get totalQuantityEstimate =>
      all.fold<num>(0, (acc, element) => acc + (element.quantityEstimate ?? 0));

  num? get totalDemolitionCost => all.fold<num>(
      0, (acc, element) => acc + (element.demolitionCostPerMaterialBatch ?? 0));

  num? get totalMaterialPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
