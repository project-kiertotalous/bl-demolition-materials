import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/demolition_waste_and_costs.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soil_aggregates_dredging_materials.freezed.dart';

/// maa-ainekset (pilaantuneilta alueilta kaivetut
/// maa-ainekset mukaan luettuina), kiviainekset ja ruoppausmassat
@freezed
abstract class SoilAggregatesDredgingMaterials
    with _$SoilAggregatesDredgingMaterials {
  SoilAggregatesDredgingMaterials._();

  factory SoilAggregatesDredgingMaterials(
          {String? hazardousSoilAndRockNotes,
          WasteLawDemolitionMaterialEstimateEntry? soilAndRockNotes,
          WasteLawDemolitionMaterialEstimateEntry? hazardousDredgingSpoil,
          WasteLawDemolitionMaterialEstimateEntry? dredgingSoil,
          WasteLawDemolitionMaterialEstimateEntry? hazardousRailwayBallast,
          WasteLawDemolitionMaterialEstimateEntry? railwayBallast,
          DemolitionWasteAndCosts? demolitionWasteAndCosts}) =
      _SoilAggregatesDredgingMaterials;

  late final hazardousSoilAndRock = WasteLawDemolitionMaterialEstimateEntry(
      volume: demolitionWasteAndCosts
          ?.disposalMaterialsAndHazardousWaste?.contaminatedSoil.volume,
      tons: demolitionWasteAndCosts
          ?.disposalMaterialsAndHazardousWaste?.contaminatedSoil.tons,
      notes: hazardousSoilAndRockNotes);
}
