import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total/building_frame_parts/exports.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'concrete_vertical_columns_frame_part.freezed.dart';

@freezed
abstract class ConcreteVerticalColumnsFramePart
    extends StructuralBuildingFramePart
    with _$ConcreteVerticalColumnsFramePart {
  ConcreteVerticalColumnsFramePart._();

  factory ConcreteVerticalColumnsFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionFractionPercentage}) = _ConcreteVerticalColumnsFramePart;

  late final VerticalConcreteColumnsFrame? verticalConcreteColumnsFrame =
      VerticalConcreteColumnsFrame(totalBuildingFrame);

  @override
  num? get concreteVolume => verticalConcreteColumnsFrame?.concreteVolume;

  @override
  num? get concreteTons => verticalConcreteColumnsFrame?.concreteTons;
}
