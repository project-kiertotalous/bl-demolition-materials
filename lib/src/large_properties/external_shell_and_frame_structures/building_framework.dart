import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_framework.freezed.dart';

@freezed
class BuildingFramework with _$BuildingFramework {
  const BuildingFramework._();

  const factory BuildingFramework(
          {@Default(false) bool useFoundationCircumference,
          num? externalWallsPerimeter,
          num? externalWallsAverageHeight,
          @Default(false) bool areMaterialsRecyclable,
          num? woodPortionFractionPercentage,
          num? glulamVerticalBeamsPortionFractionPercentage,
          num? concreteVerticalColumnsPortionFractionPercentage,
          num? steelVerticalColumnsPortionFractionPercentage,
          num? doubleLoadBearingBrickWallPortionFractionPercentage,
          num? concreteElementWallsWithoutFrameworkPortionFractionPercentage,
          num? brickCladWallPortionFractionPercentage,
          num? boardWallPortionFractionPercentage,
          num? profiledSheetMetalPortionFractionPercentage,
          num? steelProfileSandwichStructurePortionFractionPercentage,
          num? mineriteOrOtherStoneBoardPortionFractionPercentage}) =
      _BuildingFramework;

  num? get doubleLoadBearingBrickWallPortionSqm => throw UnimplementedError();

  num? get concreteElementWallsWithoutFrameworkPortionSqm =>
      throw UnimplementedError();

// TODO: Implement aggregates
}
