import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'floor_structure.dart';

part 'floor_structures.freezed.dart';

@freezed
class FloorStructures with _$FloorStructures {
  const FloorStructures._();

  const factory FloorStructures(
          {FloorStructure? officeSpaces,
          FloorStructure? lobbiesAndOtherCommonAreas,
          FloorStructure? restroomsAndWashingFacilities,
          FloorStructure? kitchens,
          FloorStructure? teachingAndTreatmentSpaces,
          FloorStructure? storageAndWorkspaces,
          FloorStructure? otherSpaces,
          @Default(false) bool surfaceMaterialCoatingContainsAsbestos}) =
      _FloorStructures;

  num? get totalArea => Utils.sumOrNull([
        officeSpaces?.totalArea,
        lobbiesAndOtherCommonAreas?.totalArea,
        restroomsAndWashingFacilities?.totalArea,
        kitchens?.totalArea,
        teachingAndTreatmentSpaces?.totalArea,
        storageAndWorkspaces?.totalArea,
        otherSpaces?.totalArea
      ]);

  num? get particleBoardingMidsoleVolume => 0; // TODO
  num? get gypsumBoardingMidsoleVolume => 0;
  num? get solidBoardingMidsoleVolume => 0;

  num? get particleBoardingMidsoleTons => 0;
  num? get gypsumBoardingMidsoleTons => 0;
  num? get solidBoardingMidsoleTons => 0;

  num? get floorPanelFloorVolume => 0;
  num? get vinylFlooringOrTileFloorVolume => 0;
  num? get parquetFloorVolume => 0;
  num? get ceramicTileFloorVolume => 0;

  num? get floorPanelFloorTons => 0;
  num? get vinylFlooringOrTileFloorTons => 0;
  num? get parquetFloorTons => 0;
  num? get ceramicTileFloorTons => 0;
}
