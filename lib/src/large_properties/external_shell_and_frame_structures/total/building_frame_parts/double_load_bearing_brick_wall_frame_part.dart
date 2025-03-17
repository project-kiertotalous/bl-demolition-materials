import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total/building_frame_parts/structural_building_frame_part.dart';

import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import 'building_envelope_frame_part.dart';

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
