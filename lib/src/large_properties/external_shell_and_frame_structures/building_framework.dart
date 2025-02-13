import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_framework.freezed.dart';

@freezed
class BuildingFramework with _$BuildingFramework {
  const factory BuildingFramework(
      {required bool useFoundationCircumference,
      required num externalWallsPerimeter,
      required num externalWallsAverageHeight,
      required bool areMaterialsRecyclable,
      required num glulamVerticalBeams,
      required num concreteVerticalBeamsPortion,
      required num steelVerticalBeamsPortion,
      required num doubleLoadBearingBrickWallPortion,
      required num concretePanelWallsWithoutFrameworkPortion,
      required num brickCladWallPortion,
      required num boardWallPortion,
      required num profiledSheetMetalPortion,
      required num steelProfileSandwichStructurePortion,
      required num mineriteOrOtherStoneBoardPortion}) = _BuildingFramework;
}
