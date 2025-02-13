import 'package:freezed_annotation/freezed_annotation.dart';

import 'floor_structure.dart';

part 'floor_structures.freezed.dart';

@freezed
class FloorStructures with _$FloorStructures {
  const factory FloorStructures(
      {required FloorStructure officeSpaces,
      required FloorStructure lobbiesAndOtherCommonAreas,
      required FloorStructure restroomsAndWashingFacilities,
      required FloorStructure kitchens,
      required FloorStructure teachingAndTreatmentSpaces,
      required FloorStructure storageAndWorkspaces,
      required FloorStructure otherSpaces,
      required bool surfaceMaterialCoatingContainsAsbestos}) = _FloorStructures;
}
