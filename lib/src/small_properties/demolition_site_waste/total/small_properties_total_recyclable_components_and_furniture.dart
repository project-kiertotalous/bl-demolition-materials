import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../apartments/exports.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../quantities_to_material_form/quantities_to_material_form.dart';
import '../../yard_buildings_and_structures/exports.dart';
import '../exports.dart';

part 'small_properties_total_recyclable_components_and_furniture.freezed.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
abstract class SmallPropertiesTotalRecyclableComponentsAndFurniture
    with _$SmallPropertiesTotalRecyclableComponentsAndFurniture {
  SmallPropertiesTotalRecyclableComponentsAndFurniture._();

  factory SmallPropertiesTotalRecyclableComponentsAndFurniture(
          {Apartment? apartment,
          ApartmentSize? apartmentSize,
          Apartments? apartments,
          CarportOrGarage? carportOrGarage,
          Counter? counter,
          HallDoors? hallDoors,
          Hvac? hvac,
          MachineryEquipmentAndFixedStructures?
              machineryEquipmentAndFixedStructures,
          PassageDoors? passageDoors,
          RecyclableComponentsNotes? recyclableComponentsNotes,
          Roof? roof,
          SmallPropertiesExcavationArea? smallPropertiesExcavationArea,
          SmallPropertiesFoundation? foundation,
          SmallPropertiesTotalReusableAndRecyclableMaterials?
              reusableAndRecyclableMaterials,
          SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo,
          SmallPropertyInnerDoors? innerDoors,
          SmallPropertyOuterDoors? outerDoors,
          SmallPropertyWindows? windows,
          ThermalCenter? thermalCenter,
          Walls? walls,
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
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.woodAndFiberboardDoorsNotes,
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
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.aluminumDoorsNotes,
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
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.steelDoorsNotes,
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// Puiset ikkunat
  late final woodenWindows = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.woodenWindows,
    pcs: windows?.recyclableWoodWindowsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.woodenWindowsNotes,
    handlingAndDismantlingCost: 10,
    unitPrice: 5,
  );

  /// Teräskarmi-ikkunat
  late final steelFrameWindows =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelWindows,
    pcs: windows?.recyclableSteelWindowsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.steelFrameWindowsNotes,
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// Alumiinikarmi-ikkunat
  late final aluminumFrameWindows =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.aluminiumWindows,
    pcs: windows?.recyclableAluminiumWindowsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.aluminumFrameWindowsNotes,
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// WC-istuimet
  late final porcelainToilets =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.toiletSeatsRecyclable,
    pcs: apartmentSize?.recyclablePorcelainSeatPcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.porcelainToiletsNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Kaapit ja kalusteet
  late final cabinetsAndFurniture =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.closetsAndFurniture,
    pcs: Utils.sumOrNull([
      apartmentSize?.recyclableDressingClosets,
      apartmentSize?.recyclableKitchenClosets
    ]),
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.cabinetsAndFurnitureNotes,
    handlingAndDismantlingCost: 10,
    unitPrice: 10,
  );

  /// Pesuallas, posliini kpl
  late final porcelainSinks = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.washingSinksRecyclable,
    pcs: apartmentSize?.recyclableWashingSinkPcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.porcelainSinksNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Teräsaltaat ja pöydät
  late final stainlessSteelSinksAndTables =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelSinksAndTables,
    pcs: apartmentSize?.recyclableSteelTablePcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.stainlessSteelSinksAndTablesNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Saunankiukaat
  late final saunaStove = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.saunaStovesRecyclable,
    pcs: apartmentSize?.recyclableSaunaStovePcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.saunaStovesNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Sähköliedet
  late final electricStove = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.electricStovesRecyclable,
    pcs: apartmentSize?.recyclableElectricStovePcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.electricStovesNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Jääkaapit
  late final refrigerator = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.refrigeratorsRecyclable,
    pcs: apartmentSize?.recyclableRefrigeratorPcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.refrigeratorsNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Vesivaraajat
  late final waterAccumulator =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.waterAccumulatorsRecyclable,
    pcs: Utils.sumOrNull([
      apartmentSize?.recyclableWaterAccumulatorPcs,
      thermalCenter?.waterHeaterPcsRecyclable
    ]),
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.waterAccumulatorsNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Sähkömoottorit
  late final electricMotors = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.electricMotorsRecyclable,
    pcs: machineryEquipmentAndFixedStructures?.recyclableElectricMotorsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.electricMotorsNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Ilmanvaihtokoneet
  late final ventilationMachines =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.ventilationMachinesRecyclable,
    pcs: machineryEquipmentAndFixedStructures
        ?.recyclableVentilationMachinesPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.ventilationMachinesNotes,
    handlingAndDismantlingCost: 20,
    unitPrice: 10,
  );

  /// Lämpökattila
  late final thermalBoiler = SmallPropertiesRecyclableComponentOrFurnitureItem(
      quantityEstimate: counter?.pelletBoilerRecyclable,
      pcs: thermalCenter?.recyclableHeatingMachinePieces,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableComponentsNotes?.thermalBoilerNotes,
      handlingAndDismantlingCost: null,
      unitPrice: null);

  /// Kaukolämmönvaihdin
  late final districtHeatingExchanger =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
          quantityEstimate: counter?.districtHeatExchangerRecyclable,
          pcs: thermalCenter?.recyclableDistrictHeatExchangerPieces,
          exploitingOrProcessingOrFinalDisposalSite:
              recyclableComponentsNotes?.districtHeatingExchangerNotes,
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
