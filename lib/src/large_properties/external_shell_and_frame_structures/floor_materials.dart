import 'package:freezed_annotation/freezed_annotation.dart';

import 'floor_material.dart';

part 'floor_materials.freezed.dart';

@freezed
class FloorMaterials with _$FloorMaterials {
  const factory FloorMaterials(
      {required FloorMaterial officeSpaces,
      required FloorMaterial lobbiesAndOtherCommonAreas,
      required FloorMaterial restroomsAndWashingFacilities,
      required FloorMaterial kitchens,
      required FloorMaterial teachingAndTreatmentSpaces,
      required FloorMaterial storageAndWorkspaces,
      required FloorMaterial otherSpaces,
      required bool coatingContainsAsbestos}) = _FloorMaterials;
}
