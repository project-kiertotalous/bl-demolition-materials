import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/bituminous_mixtures_coal_tar_products.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/concrete_bricks_tiles_ceramics.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/gypsum_based_building_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/insulation_and_asbestos_containing_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/metals_and_alloys.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/soil_aggregates_dredging_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/wood_glass_plastics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'waste_law_demolition_material_estimates.freezed.dart';

/// Purkumateriaalien määrä arvio
@freezed
class WasteLawDemolitionMaterialEstimates
    with _$WasteLawDemolitionMaterialEstimates {
  const factory WasteLawDemolitionMaterialEstimates(
      {ConcreteBricksTilesCeramics? concreteBricksTilesCeramics,
      WoodGlassPlastics? woodGlassPlastics,
      BituminousMixturesCoalTarProducts? bituminousMixturesCoalTarProducts,
      MetalsAndAlloys? metalsAndAlloys,
      SoilAggregatesDredgingMaterials? soilAggregatesDredgingMaterials,
      InsulationAndAsbestosContainingMaterials?
          insulationAndAsbestosContainingMaterials,
      GypsumBasedBuildingMaterials? gypsumBasedBuildingMaterials,
      OtherMaterials}) = _WasteLawDemolitionMaterialEstimates;
}
