import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import 'exports.dart';

part 'concrete_element_walls_without_framework_frame_part.freezed.dart';

@freezed
abstract class ConcreteElementWallsWithoutFrameworkFramePart
    with _$ConcreteElementWallsWithoutFrameworkFramePart
    implements StructuralBuildingFramePart, BuildingEnvelopeFramePart {
  ConcreteElementWallsWithoutFrameworkFramePart._();

  factory ConcreteElementWallsWithoutFrameworkFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _ConcreteElementWallsWithoutFrameworkFramePart;

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

  @override
  num? get area => null;

  @override
  num? get brickTons => null;

  @override
  num? get brickVolume => null;

  @override
  num? get steelTons => null;

  @override
  num? get woodTons => null;

  @override
  num? get woodVolume => null;
}
