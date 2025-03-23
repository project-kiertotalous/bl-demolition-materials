import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import 'building_envelope_frame_part.dart';

part 'steel_sandwich_panel_frame_part.freezed.dart';

@freezed
abstract class SteelSandwichPanelFramePart extends BuildingEnvelopeFramePart
    with _$SteelSandwichPanelFramePart {
  SteelSandwichPanelFramePart._();

  factory SteelSandwichPanelFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionFractionPercentage}) = _SteelSandwichPanelFramePart;

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
