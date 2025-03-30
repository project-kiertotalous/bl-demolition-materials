import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../../utils/utils.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import 'exports.dart';

part 'double_load_bearing_brick_wall_frame_part.freezed.dart';

@freezed
abstract class DoubleLoadBearingBrickWallFramePart
    with _$DoubleLoadBearingBrickWallFramePart
    implements StructuralBuildingFramePart, BuildingEnvelopeFramePart {
  DoubleLoadBearingBrickWallFramePart._();

  factory DoubleLoadBearingBrickWallFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _DoubleLoadBearingBrickWallFramePart;

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

  @override
  num? get concreteTons => null;

  @override
  num? get concreteVolume => null;

  @override
  num? get steelTons => null;

  @override
  num? get woodTons => null;

  @override
  num? get woodVolume => null;

  @override
  num? get area => Utils.multiplyOrNull([
        totalBuildingFrame?.externalWallsPerimeter,
        totalBuildingFrame?.externalWallsHeight,
        Utils.percentageToFraction(portionPercentage)
      ]);
}
