import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total/building_frame_parts/exports.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wood_frame_part.freezed.dart';

@freezed
class WoodFramePart extends StructuralBuildingFramePart with _$WoodFramePart {
  WoodFramePart._();

  factory WoodFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionFractionPercentage}) = _WoodFramePart;

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
