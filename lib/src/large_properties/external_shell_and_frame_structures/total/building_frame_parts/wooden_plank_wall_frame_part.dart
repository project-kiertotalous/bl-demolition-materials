import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total/building_frame_parts/exports.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wooden_plank_wall_frame_part.freezed.dart';

@freezed
class WoodenPlankWallFramePart extends BuildingEnvelopeFramePart
    with _$WoodenPlankWallFramePart {
  WoodenPlankWallFramePart._();

  factory WoodenPlankWallFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionFractionPercentage}) = _WoodenPlankWallFramePart;

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
