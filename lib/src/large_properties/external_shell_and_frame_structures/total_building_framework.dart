import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/building_framework.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total_foundations.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_building_framework.freezed.dart';

@freezed
class TotalBuildingFrame with _$TotalBuildingFrame  {
  TotalBuildingFrame._();

  factory TotalBuildingFrame(
      {BuildingFramework? buildingFramework,
      TotalFoundations? totalFoundations}) = _TotalBuildingFrame;

  num? get externalWallsHeight => buildingFramework?.externalWallsAverageHeight;

  num? get externalWallsPerimeter {
    if (buildingFramework == null) {
      return null;
    }

    if (buildingFramework!.useFoundationCircumference == true) {
      return totalFoundations?.circumference;
    }

    return buildingFramework?.externalWallsPerimeter;
  }

  late final StructuralBuildingFramePart woodFramePart = WoodFramePart(
      totalBuildingFrame: this,
      portionFractionPercentage:
          buildingFramework?.woodPortionFractionPercentage);

  late final StructuralBuildingFramePart glulamBeamsPart = GlulamBeamsPart(
      totalBuildingFrame: this,
      portionFractionPercentage:
          buildingFramework?.glulamVerticalColumnsPortionFractionPercentage);

  late final StructuralBuildingFramePart concreteVerticalColumnsPart =
      ConcreteVerticalColumnsFramePart(
          totalBuildingFrame: this,
          portionFractionPercentage: buildingFramework
              ?.concreteVerticalColumnsPortionFractionPercentage);

  late final StructuralBuildingFramePart steelVerticalColumnsPart =
      SteelVerticalColumnsFramePart(
          totalBuildingFrame: this,
          portionFractionPercentage:
              buildingFramework?.steelVerticalColumnsPortionFractionPercentage);

  late final StructuralBuildingFramePart doubleLoadBearingBrickWallPart =
      DoubleLoadBearingBrickWallFramePart(
          totalBuildingFrame: this,
          portionFractionPercentage: buildingFramework
              ?.doubleLoadBearingBrickWallPortionFractionPercentage);

  late final StructuralBuildingFramePart
      concreteElementWallsWithoutFrameworkPart =
      ConcreteElementWallsWithoutFrameworkFramePart(
          totalBuildingFrame: this,
          portionFractionPercentage: buildingFramework
              ?.concreteElementWallsWithoutFrameworkPortionFractionPercentage);

  num? get totalStructuralPartsPortionFractionPercentage => Utils.sumOrNull([
        woodFramePart.portionFractionPercentage,
        glulamBeamsPart.portionFractionPercentage,
        concreteVerticalColumnsPart.portionFractionPercentage,
        steelVerticalColumnsPart.portionFractionPercentage,
        doubleLoadBearingBrickWallPart.portionFractionPercentage,
        concreteVerticalColumnsPart.portionFractionPercentage
      ]);

  num? get totalStructuralPartsArea => Utils.sumOrNull([
        woodFramePart.area,
        glulamBeamsPart.area,
        concreteVerticalColumnsPart.area,
        steelVerticalColumnsPart.area,
        doubleLoadBearingBrickWallPart.area,
        concreteVerticalColumnsPart.area
      ]);

  num? get woodVolume =>
      Utils.sumOrNull([woodFramePart.woodVolume, glulamBeamsPart.woodVolume]);

  num? get woodTons =>
      Utils.sumOrNull([woodFramePart.woodTons, glulamBeamsPart.woodTons]);

  num? get concreteVolume => Utils.sumOrNull([
        concreteVerticalColumnsPart.concreteVolume,
        concreteElementWallsWithoutFrameworkPart.concreteVolume
      ]);

  num? get concreteTons => Utils.sumOrNull([
        concreteVerticalColumnsPart.concreteTons,
        concreteElementWallsWithoutFrameworkPart.concreteTons
      ]);

  num? get steelTons => steelVerticalColumnsPart.steelTons;

  num? get brickVolume => doubleLoadBearingBrickWallPart.brickVolume;

  num? get brickTons => doubleLoadBearingBrickWallPart.brickTons;

  // TODO: Implement StructuralBuildingFramePart and BuildingEnvelopeFramePart
}
