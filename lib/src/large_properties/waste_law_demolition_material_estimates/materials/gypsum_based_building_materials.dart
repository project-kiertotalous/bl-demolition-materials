import 'package:freezed_annotation/freezed_annotation.dart';

part 'gypsum_based_building_materials.freezed.dart';

/// kipsipohjaiset rakennusaineet
@freezed
abstract class GypsumBasedBuildingMaterials
    with _$GypsumBasedBuildingMaterials {
  const factory GypsumBasedBuildingMaterials() = _GypsumBasedBuildingMaterials;
}
