import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/building_framework.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total_foundations.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_building_framework.freezed.dart';

@freezed
class TotalBuildingFramework with _$TotalBuildingFramework {
  const TotalBuildingFramework._();

  const factory TotalBuildingFramework(
      {BuildingFramework? buildingFramework,
      TotalFoundations? totalFoundations}) = _TotalBuildingFramework;

  bool? get useFoundationCircumference =>
      buildingFramework?.useFoundationCircumference;

  num? get externalWallsPerimeter => buildingFramework?.externalWallsPerimeter;

  num? get externalWallsAverageHeight =>
      buildingFramework?.externalWallsAverageHeight;

  bool? get areMaterialsRecyclable => buildingFramework?.areMaterialsRecyclable;

  num? get woodPortionFractionPercentage =>
      buildingFramework?.woodPortionFractionPercentage;

  num? get glulamVerticalColumnsPortionFractionPercentage =>
      buildingFramework?.glulamVerticalColumnsPortionFractionPercentage;

  num? get concreteVerticalColumnsPortionFractionPercentage =>
      buildingFramework?.concreteVerticalColumnsPortionFractionPercentage;

  num? get steelVerticalColumnsPortionFractionPercentage =>
      buildingFramework?.steelVerticalColumnsPortionFractionPercentage;

  num? get doubleLoadBearingBrickWallPortionFractionPercentage =>
      buildingFramework?.doubleLoadBearingBrickWallPortionFractionPercentage;

  num? get concreteElementWallsWithoutFrameworkPortionFractionPercentage =>
      buildingFramework
          ?.concreteElementWallsWithoutFrameworkPortionFractionPercentage;

  num? get brickCladWallPortionFractionPercentage =>
      buildingFramework?.brickCladWallPortionFractionPercentage;

  num? get boardWallPortionFractionPercentage =>
      buildingFramework?.boardWallPortionFractionPercentage;

  num? get profiledSheetMetalPortionFractionPercentage =>
      buildingFramework?.profiledSheetMetalPortionFractionPercentage;

  num? get steelProfileSandwichStructurePortionFractionPercentage =>
      buildingFramework?.steelProfileSandwichStructurePortionFractionPercentage;

  num? get mineriteOrOtherStoneBoardPortionFractionPercentage =>
      buildingFramework?.mineriteOrOtherStoneBoardPortionFractionPercentage;

  num? get doubleLoadBearingBrickWallPortionSqm => throw UnimplementedError();

  num? get concreteElementWallsWithoutFrameworkPortionSqm =>
      throw UnimplementedError();

  /// Use this to get the actual external walls perimeter.
  num? get canonicalExternalWallsPerimeter {
    if (useFoundationCircumference == true) {
      return totalFoundations?.circumference;
    }

    return externalWallsPerimeter;
  }

  num? get woodVolume => Utils.multiplyOrNull([
        woodPortionFractionPercentage,
        canonicalExternalWallsPerimeter,
        externalWallsAverageHeight
      ]);

  num? get glulamVerticalBeamVolume => Utils.multiplyOrNull([
        glulamVerticalColumnsPortionFractionPercentage,
        canonicalExternalWallsPerimeter,
        externalWallsAverageHeight
      ]);

  num? get concreteVerticalColumnsVolume => Utils.multiplyOrNull([
        concreteVerticalColumnsPortionFractionPercentage,
        canonicalExternalWallsPerimeter,
        externalWallsAverageHeight
      ]);

  num? get steelVerticalColumnsVolume => Utils.multiplyOrNull([
        steelVerticalColumnsPortionFractionPercentage,
        canonicalExternalWallsPerimeter,
        externalWallsAverageHeight
      ]);

  num? get doubleLoadBearingBrickWallVolume => Utils.multiplyOrNull([
        doubleLoadBearingBrickWallPortionFractionPercentage,
        canonicalExternalWallsPerimeter,
        externalWallsAverageHeight
      ]);

  num? get concreteElementWallsWithoutFrameworkVolume => Utils.multiplyOrNull([
        concreteElementWallsWithoutFrameworkPortionFractionPercentage,
        canonicalExternalWallsPerimeter,
        externalWallsAverageHeight
      ]);

  num? get totalExternalWallsPortionFractionPercentage => Utils.sumOrNull([
        woodPortionFractionPercentage,
        glulamVerticalColumnsPortionFractionPercentage,
        concreteVerticalColumnsPortionFractionPercentage,
        steelVerticalColumnsPortionFractionPercentage,
        doubleLoadBearingBrickWallPortionFractionPercentage,
        concreteElementWallsWithoutFrameworkPortionFractionPercentage
      ]);

  num? get totalExternalWallsVolume => Utils.sumOrNull([
        woodVolume,
        glulamVerticalBeamVolume,
        concreteVerticalColumnsVolume,
        steelVerticalColumnsVolume,
        doubleLoadBearingBrickWallVolume,
        concreteElementWallsWithoutFrameworkVolume
      ]);
}
