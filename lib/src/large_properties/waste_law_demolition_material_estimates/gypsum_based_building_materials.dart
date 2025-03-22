import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gypsum_based_building_materials.freezed.dart';

/// kipsipohjaiset rakennusaineet
@freezed
abstract class GypsumBasedBuildingMaterials
    with _$GypsumBasedBuildingMaterials {
  const factory GypsumBasedBuildingMaterials(
          {WasteLawDemolitionMaterialEstimateEntry?
              contaminatedGypsumBasedMaterials,
          WasteLawDemolitionMaterialEstimateEntry? otherGypsumBasedMaterials}) =
      _GypsumBasedBuildingMaterials;
}
