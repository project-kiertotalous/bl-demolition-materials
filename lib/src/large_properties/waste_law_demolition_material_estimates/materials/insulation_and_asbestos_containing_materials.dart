import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insulation_and_asbestos_containing_materials.freezed.dart';

/// eristysaineet ja asbestia sisältävät rakennusaineet
@freezed
abstract class InsulationAndAsbestosContainingMaterials
    with _$InsulationAndAsbestosContainingMaterials {
  const factory InsulationAndAsbestosContainingMaterials(
          {WasteLawDemolitionMaterialEstimateEntry?
              asbestosContainingInsulationMaterials,
          WasteLawDemolitionMaterialEstimateEntry?
              otherHazardousInsulationMaterials,
          WasteLawDemolitionMaterialEstimateEntry? otherInsulationMaterials,
          WasteLawDemolitionMaterialEstimateEntry?
              asbestosContainingBuildingMaterials}) =
      _InsulationAndAsbestosContainingMaterials;
}
