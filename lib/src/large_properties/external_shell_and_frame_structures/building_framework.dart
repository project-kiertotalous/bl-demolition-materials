import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_framework.freezed.dart';

@freezed
class BuildingFramework with _$BuildingFramework {
  const factory BuildingFramework(
      {@Default(false) bool useFoundationCircumference,
      num? externalWallsPerimeter,
      num? externalWallsAverageHeight,
      @Default(false) bool areMaterialsRecyclable,
      num? glulamVerticalBeams,
      num? concreteVerticalBeamsPortion,
      num? steelVerticalBeamsPortion,
      num? doubleLoadBearingBrickWallPortion,
      num? concretePanelWallsWithoutFrameworkPortion,
      num? brickCladWallPortion,
      num? boardWallPortion,
      num? profiledSheetMetalPortion,
      num? steelProfileSandwichStructurePortion,
      num? mineriteOrOtherStoneBoardPortion}) = _BuildingFramework;
}
