import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import 'building_envelope_frame_part.dart';

part 'minerite_or_other_stone_frame_part.freezed.dart';

@freezed
abstract class MineriteOrOtherStoneFramePart extends BuildingEnvelopeFramePart
    with _$MineriteOrOtherStoneFramePart {
  MineriteOrOtherStoneFramePart._();

  factory MineriteOrOtherStoneFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionFractionPercentage}) = _MineriteOrOtherStoneFramePart;

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
