import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total_building_frame.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import '../demolition_materials/outer_walls_and_frame_demolition_materials.dart';

part 'building_frame.freezed.dart';

@freezed
class BuildingFrame with _$BuildingFrame {
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
}

abstract class BuildingFramePart {
  final num? portionFractionPercentage;

  final TotalBuildingFrame? totalBuildingFrame;

  BuildingFramePart({this.totalBuildingFrame, this.portionFractionPercentage});

  num? get area => Utils.multiplyOrNull([
        totalBuildingFrame?.externalWallsPerimeter,
        totalBuildingFrame?.externalWallsHeight,
        portionFractionPercentage
      ]);
}

abstract class StructuralBuildingFramePart extends BuildingFramePart {
  StructuralBuildingFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  num? get woodVolume => null;

  num? get woodTons => null;

  num? get concreteVolume => null;

  num? get concreteTons => null;

  num? get steelTons => null;

  num? get brickVolume => null;

  num? get brickTons => null;
}

class WoodFramePart extends StructuralBuildingFramePart {
  WoodFramePart({super.totalBuildingFrame, super.portionFractionPercentage});

  late final WoodFrame? woodFrame = WoodFrame();

  @override
  num? get woodVolume {
    if (woodFrame?.kgPerSquareMeter == null ||
        woodFrame?.kgPerCubicMeter == null ||
        area == null) {
      return null;
    }

    return woodFrame!.kgPerSquareMeter * area! / woodFrame!.kgPerCubicMeter;
  }

  @override
  num? get woodTons {
    if (woodFrame?.kgPerSquareMeter == null ||
        woodFrame?.kgPerCubicMeter == null ||
        area == null) {
      return null;
    }

    return woodFrame!.kgPerSquareMeter * area! / woodFrame!.kgPerCubicMeter;
  }
}

class GlulamBeamsPart extends StructuralBuildingFramePart {
  GlulamBeamsPart({super.totalBuildingFrame, super.portionFractionPercentage});

  late final VerticalGlulamBeamsFrame? glulamBeamsFrame =
      VerticalGlulamBeamsFrame(totalBuildingFrame);

  @override
  num? get woodVolume {
    if (portionFractionPercentage == null ||
        glulamBeamsFrame?.woodVolume == null) {
      return null;
    }

    return portionFractionPercentage! * glulamBeamsFrame!.woodVolume!;
  }

  @override
  num? get woodTons {
    if (portionFractionPercentage == null ||
        glulamBeamsFrame?.woodVolume == null) {
      return null;
    }

    return portionFractionPercentage! * glulamBeamsFrame!.woodTons!;
  }
}

class ConcreteVerticalColumnsFramePart extends StructuralBuildingFramePart {
  ConcreteVerticalColumnsFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  late final VerticalConcreteColumnsFrame? verticalConcreteColumnsFrame =
      VerticalConcreteColumnsFrame(totalBuildingFrame);

  @override
  num? get concreteVolume => verticalConcreteColumnsFrame?.concreteVolume;

  @override
  num? get concreteTons => verticalConcreteColumnsFrame?.concreteTons;
}

class SteelVerticalColumnsFramePart extends StructuralBuildingFramePart {
  SteelVerticalColumnsFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  late final VerticalSteelColumnsFrame? verticalSteelColumnsFrame =
      VerticalSteelColumnsFrame(totalBuildingFrame);

  @override
  num? get steelTons => verticalSteelColumnsFrame?.steelTons;
}

abstract class BuildingEnvelopeFramePart extends BuildingFramePart {
  BuildingEnvelopeFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  num? get windProtectionBoardTons => null;

  num? get mineralWoolInsulationTons => null;

  num? get limeOrRedBrickTons => null;

  num? get exteriorWoodCladdingTons => null;

  num? get gypsumBoardTons => null;

  num? get profileSteelSheetTons => null;

  num? get semiHardFiberBoardTons => null;

  num? get styrofoamTons => null;

  num? get plasterCoatingTons => null;

  num? get mineriteBoardTons => null;
}

class BrickVeneerWallFramePart extends BuildingEnvelopeFramePart {
  BrickVeneerWallFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  final windProtectionBoardFrame = WindProtectionBoardFrame();
  final mineralWoolFrame = MineralWoolFrame();
  final limeOrRedBrickFrame = LimeOrRedBrickFrame();
  final plasterBoardFrame = PlasterBoardFrame();

  @override
  num? get windProtectionBoardTons => area == null
      ? null
      : area! * windProtectionBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get limeOrRedBrickTons =>
      area == null ? null : area! * limeOrRedBrickFrame.kgPerSquareMeter / 1000;

  @override
  num? get gypsumBoardTons =>
      area == null ? null : area! * plasterBoardFrame.kgPerSquareMeter / 1000;
}

class WoodenPlankWallFramePart extends BuildingEnvelopeFramePart {
  WoodenPlankWallFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  final windProtectionBoardFrame = WindProtectionBoardFrame();
  final mineralWoolFrame = MineralWoolFrame();
  final limeOrRedBrickFrame = LimeOrRedBrickFrame();
  final exteriorCladdingBoardFrame = ExteriorCladdingBoardFrame();
  final plasterBoardFrame = PlasterBoardFrame();

  @override
  num? get windProtectionBoardTons => area == null
      ? null
      : area! * windProtectionBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get limeOrRedBrickTons =>
      area == null ? null : area! * limeOrRedBrickFrame.kgPerSquareMeter / 1000;

  @override
  num? get exteriorWoodCladdingTons => area == null
      ? null
      : area! * exteriorCladdingBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get gypsumBoardTons =>
      area == null ? null : area! * plasterBoardFrame.kgPerSquareMeter / 1000;
}

class ProfiledSheetMetalFramePart extends BuildingEnvelopeFramePart {
  ProfiledSheetMetalFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  final windProtectionBoardFrame = WindProtectionBoardFrame();
  final mineralWoolFrame = MineralWoolFrame();
  final plasterBoardFrame = PlasterBoardFrame();
  final profiledSheetMetalBoard = ProfiledSheetMetalBoard();

  @override
  num? get windProtectionBoardTons => area == null
      ? null
      : area! * windProtectionBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get gypsumBoardTons =>
      area == null ? null : area! * plasterBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get profileSteelSheetTons => area == null
      ? null
      : area! * profiledSheetMetalBoard.kgPerSquareMeter / 1000;
}

class SteelSandwichPanelFramePart extends BuildingEnvelopeFramePart {
  SteelSandwichPanelFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  final mineralWoolFrame = MineralWoolFrame();
  final plasterBoardFrame = PlasterBoardFrame();
  final styrofoamFrame = StyrofoamFrame();

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get gypsumBoardTons =>
      area == null ? null : area! * plasterBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get styrofoamTons =>
      area == null ? null : area! * styrofoamFrame.kgPerSquareMeter / 1000;
}

class MineriteOrOtherStoneFramePart extends BuildingEnvelopeFramePart {
  MineriteOrOtherStoneFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  final mineralWoolFrame = MineralWoolFrame();
  final semiHardFiberBoardFrame = SemiHardFiberBoardFrame();
  final mineriteBoardFrame = MineriteBoardFrame();

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get semiHardFiberBoardTons => area == null
      ? null
      : area! * semiHardFiberBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineriteBoardTons =>
      area == null ? null : area! * mineriteBoardFrame.kgPerSquareMeter / 1000;
}

class DoubleLoadBearingBrickWallFramePart extends StructuralBuildingFramePart
    implements BuildingEnvelopeFramePart {
  DoubleLoadBearingBrickWallFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  late final DoubleBrickWallFrame? doubleBrickWallFrame =
      DoubleBrickWallFrame(totalBuildingFrame);

  final mineralWoolFrame = MineralWoolFrame();
  final styrofoamFrame = StyrofoamFrame();

  @override
  num? get brickVolume => doubleBrickWallFrame?.volume;

  @override
  num? get brickTons => doubleBrickWallFrame?.tons;

  @override
  num? get windProtectionBoardTons => null;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get limeOrRedBrickTons => null;

  @override
  num? get exteriorWoodCladdingTons => null;

  @override
  num? get gypsumBoardTons => null;

  @override
  num? get profileSteelSheetTons => null;

  @override
  num? get semiHardFiberBoardTons => null;

  @override
  num? get styrofoamTons =>
      area == null ? null : area! * styrofoamFrame.kgPerSquareMeter / 1000;

  @override
  num? get plasterCoatingTons => null;

  @override
  num? get mineriteBoardTons => null;
}

class ConcreteElementWallsWithoutFrameworkFramePart
    extends StructuralBuildingFramePart implements BuildingEnvelopeFramePart {
  ConcreteElementWallsWithoutFrameworkFramePart(
      {super.totalBuildingFrame, super.portionFractionPercentage});

  late final ConcreteWallElementFrame? concreteWallElementFrame =
      ConcreteWallElementFrame(totalBuildingFrame);

  final plasteringInteriorAndExteriorWallsFrame =
      PlasteringInteriorAndExteriorWallsFrame();

  final mineralWoolFrame = MineralWoolFrame();

  @override
  num? get concreteVolume => concreteWallElementFrame?.concreteVolume;

  @override
  num? get concreteTons => concreteWallElementFrame?.concreteTons;

  @override
  num? get windProtectionBoardTons => null;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get limeOrRedBrickTons => null;

  @override
  num? get exteriorWoodCladdingTons => null;

  @override
  num? get gypsumBoardTons => null;

  @override
  num? get profileSteelSheetTons => null;

  @override
  num? get semiHardFiberBoardTons => null;

  @override
  num? get styrofoamTons => null;

  @override
  num? get plasterCoatingTons => area == null
      ? null
      : area! * plasteringInteriorAndExteriorWallsFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineriteBoardTons => null;
}
