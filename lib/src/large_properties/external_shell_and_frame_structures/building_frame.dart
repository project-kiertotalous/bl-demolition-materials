import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_frame.freezed.dart';
part 'building_frame.g.dart';

@freezed
abstract class BuildingFrame with _$BuildingFrame {
  const BuildingFrame._();

  const factory BuildingFrame(
          {@Default(false) bool useFoundationCircumference,
          num? externalWallsPerimeter,
          num? externalWallsAverageHeight,
          @Default(false) bool areMaterialsRecyclable,
          num? woodPortionFractionPercentage,
          num? glulamVerticalColumnsPortionFractionPercentage,
          num? concreteVerticalColumnsPortionFractionPercentage,
          num? steelVerticalColumnsPortionFractionPercentage,
          num? doubleLoadBearingBrickWallPortionFractionPercentage,
          num? concreteElementWallsWithoutFrameworkPortionFractionPercentage,
          num? brickCladWallPortionFractionPercentage,
          num? boardWallPortionFractionPercentage,
          num? profiledSheetMetalPortionFractionPercentage,
          num? steelProfileSandwichStructurePortionFractionPercentage,
          num? mineriteOrOtherStoneBoardPortionFractionPercentage}) =
      _BuildingFrame;

  factory BuildingFrame.fromJson(Map<String, dynamic> json) =>
      _$BuildingFrameFromJson(json);
}
