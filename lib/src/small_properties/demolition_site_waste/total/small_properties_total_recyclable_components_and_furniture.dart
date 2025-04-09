import 'package:freezed_annotation/freezed_annotation.dart';

import '../items/exports.dart';
import '../../../utils/utils.dart';
import '../../apartments/exports.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../quantities_to_material_form/quantities_to_material_form.dart';
import '../../yard_buildings_and_structures/exports.dart';
import '../total/small_properties_total_reusable_and_recyclable_materials.dart';

part 'small_properties_total_recyclable_components_and_furniture.freezed.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
abstract class SmallPropertiesTotalRecyclableComponentsAndFurniture
    with _$SmallPropertiesTotalRecyclableComponentsAndFurniture {
  SmallPropertiesTotalRecyclableComponentsAndFurniture._();

  factory SmallPropertiesTotalRecyclableComponentsAndFurniture(
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
      _SmalllPropertiesTotalRecyclableComponentsAndFurniture;

  /// Puu- ja kuitulevyovet
  late final woodAndFiberboardDoors =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.woodenDoors,
    pcs: Utils.sumOrNull([
      outerDoors?.recyclableWoodDoorsPieces,
      passageDoors?.recyclableWoodDoorPieces,
      hallDoors?.recyclableWoodDoorPieces,
      innerDoors?.recyclableWoodenInnerDoorsPieces,
      innerDoors?.recyclablePanelInnerDoorsPieces
    ]),
    handlingAndDismantlingCost: 10,
    unitPrice: 5,
  );

  /// Alumiiniovet
  late final aluminumDoors = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.aluminiumDoors,
    pcs: Utils.sumOrNull([
      outerDoors?.recyclableAluminiumDoorsPieces,
      passageDoors?.recyclableAluminiumDoorPieces,
      hallDoors?.recyclableAluminiumDoorPieces
    ]),
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// Teräsovet
  late final steelDoors = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelDoors,
    pcs: Utils.sumOrNull([
      outerDoors?.recyclableSteelDoorsPieces,
      passageDoors?.recyclableSteelDoorPieces,
      hallDoors?.recyclableSteelDoorPieces
    ]),
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// Puiset ikkunat
  late final woodenWindows = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.woodenWindows,
    pcs: windows?.recyclableWoodWindowsPieces,
    handlingAndDismantlingCost: 10,
    unitPrice: 5,
  );

  /// Teräskarmi-ikkunat
  late final steelFrameWindows =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelWindows,
    pcs: windows?.recyclableSteelWindowsPieces,
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// Alumiinikarmi-ikkunat
  late final aluminumFrameWindows =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.aluminiumWindows,
    pcs: windows?.recyclableAluminiumWindowsPieces,
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// WC-istuimet
  late final porcelainToilets =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.toiletSeatsRecyclable,
    pcs: porcelainSeats?.recyclablePorcelainSeatPcs,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Kaapit ja kalusteet
  late final cabinetsAndFurniture =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.closetsAndFurniture,
    pcs: Utils.sumOrNull([
      dressingClosets?.recyclableDressingClosets,
      kitchenClosets?.recyclableKitchenClosets
    ]),
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// Pesuallas, posliini kpl
  late final porcelainSinks = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.washingSinksRecyclable,
    pcs: washingSinks?.recyclableWashingSinkPcs,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Teräsaltaat ja pöydät
  late final stainlessSteelSinksAndTables =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelSinksAndTables,
    pcs: steelTablesAndSinks?.recyclableSteelTablePcs,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Saunankiukaat
  late final saunaStove = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.saunaStovesRecyclable,
    pcs: saunaStoves?.recyclableSaunaStovePcs,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Sähköliedet
  late final electricStove = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.electricStovesRecyclable,
    pcs: electricStoves?.recyclableElectricStovePcs,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Jääkaapit
  late final refrigerator = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.refrigeratorsRecyclable,
    pcs: refrigerators?.recyclableRefrigeratorPcs,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Vesivaraajat
  late final waterAccumulator =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.waterAccumulatorsRecyclable,
    pcs: Utils.sumOrNull([
      waterAccumulators?.recyclableWaterAccumulatorPcs,
      thermalCenter?.waterHeaterPcsRecyclable
    ]),
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Sähkömoottorit
  late final electricMotors = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.electricMotorsRecyclable,
    pcs: machineryEquipmentAndFixedStructures?.recyclableElectricMotorsPieces,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Ilmanvaihtokoneet
  late final ventilationMachines =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.ventilationMachinesRecyclable,
    pcs: machineryEquipmentAndFixedStructures
        ?.recyclableVentilationMachinesPieces,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Lämpökattila
  late final thermalBoiler = SmallPropertiesRecyclableComponentOrFurnitureItem(
      quantityEstimate: counter?.pelletBoilerRecyclable,
      pcs: thermalCenter?.recyclableHeatingMachinePieces,
      handlingAndDismantlingCost: null,
      unitPrice: null);

  /// Kaukolämmönvaihdin
  late final districtHeatingExchanger =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
          quantityEstimate: counter?.districtHeatExchangerRecyclable,
          pcs: thermalCenter?.recyclableDistrictHeatExchangerPieces,
          handlingAndDismantlingCost: null,
          unitPrice: null);

  List<SmallPropertiesRecyclableComponentOrFurnitureItem> get all => [
        woodAndFiberboardDoors,
        aluminumDoors,
        steelDoors,
        woodenWindows,
        steelFrameWindows,
        aluminumFrameWindows,
        porcelainToilets,
        cabinetsAndFurniture,
        porcelainSinks,
        stainlessSteelSinksAndTables,
        saunaStove,
        electricStove,
        refrigerator,
        waterAccumulator,
        electricMotors,
        ventilationMachines,
        thermalBoiler,
        districtHeatingExchanger,
      ];

  num? get totalQuantityEstimate =>
      all.fold<num>(0, (acc, element) => acc + (element.quantityEstimate ?? 0));

  num? get totalDemolitionCost => all.fold<num>(
      0, (acc, element) => acc + (element.demolitionCostPerMaterialBatch ?? 0));

  num? get totalBatchPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
