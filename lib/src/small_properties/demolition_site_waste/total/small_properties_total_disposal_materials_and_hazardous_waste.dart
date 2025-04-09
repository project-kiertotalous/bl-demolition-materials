import 'package:freezed_annotation/freezed_annotation.dart';

import '../../apartments/exports.dart';
import '../items/exports.dart';
import '../../../utils/utils.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../quantities_to_material_form/quantities_to_material_form.dart';
import '../../yard_buildings_and_structures/exports.dart';

part 'small_properties_total_disposal_materials_and_hazardous_waste.freezed.dart';

/// Loppusijoitettavat materiaalit ja ongelmajätteet
@freezed
abstract class SmallPropertiesTotalDisposalMaterialsAndHazardousWaste
    with _$SmallPropertiesTotalDisposalMaterialsAndHazardousWaste {
  SmallPropertiesTotalDisposalMaterialsAndHazardousWaste._();

  factory SmallPropertiesTotalDisposalMaterialsAndHazardousWaste(
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
      _SmallPropertiesTotalDisposalMaterialsAndHazardousWaste;

  /// Käyttökelvoton kaakeli, posliini sekä lasi- ja mineraalieristevilla
  late final ceramicTilePorcelainAndGlassAndInsulationWool =
      SmallPropertiesWasteDisposalItem(
          quantityEstimate: counter?.nonRecyclableCeramicWaste,
          demolitionOrProcessingCost: 15);

  /// Kierrätyskelvoton tiilijäte
  late final nonRecyclableBrickWaste = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.nonRecyclableBrickWaste,
      demolitionOrProcessingCost: 15);

  /// Kierrätyskelvoton kipsilevy
  late final nonRecyclablePlasterBoard = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.nonRecyclablePlasterBoardTons,
      demolitionOrProcessingCost: 15);

  /// Saastunut maa
  late final contaminatedSoil = SmallPropertiesWasteDisposalItem(
      quantityEstimate: Utils.multiplyOrNull([
        smallPropertiesExcavationArea?.soilToBeRemovedTons,
        smallPropertiesExcavationArea?.contaminatedSoil
      ]),
      demolitionOrProcessingCost: 20);

  /// Asbestia sisältävä betoni
  late final concreteContainingAsbestos = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.concreteWithAsbestos,
      demolitionOrProcessingCost: 20);

  /// Mineriitti- tai huopakate, sisältää asbestia
  late final mineriteOrFeltContainingAsbestos =
      SmallPropertiesWasteDisposalItem(
          quantityEstimate: counter?.mineriteOrFeltContainsAsbestos,
          demolitionOrProcessingCost: 20);

  /// PCB maalia sisältävä betoni
  late final concreteContainingPcbPaint = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.concreteWithPcbPaints,
      demolitionOrProcessingCost: 20);

  List<SmallPropertiesWasteDisposalItem> get all => [
        ceramicTilePorcelainAndGlassAndInsulationWool,
        nonRecyclableBrickWaste,
        nonRecyclablePlasterBoard,
        contaminatedSoil,
        concreteContainingAsbestos,
        mineriteOrFeltContainingAsbestos,
        concreteContainingPcbPaint
      ];

  num? get totalQuantityEstimate => Utils.sumOrNull([
        ceramicTilePorcelainAndGlassAndInsulationWool.quantityEstimate,
        nonRecyclableBrickWaste.quantityEstimate,
        nonRecyclablePlasterBoard.quantityEstimate,
        contaminatedSoil.quantityEstimate,
        mineriteOrFeltContainingAsbestos.quantityEstimate,
        counter?.contaminatedConcrete,
      ]);

  num? get totalDemolitionBatchPrice => all.fold<num>(
      0, (acc, element) => acc + (element.demolitionBatchPrice ?? 0));
}
