import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total/building_frame_parts/exports.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'glulam_beams_frame_part.freezed.dart';

@freezed
abstract class GlulamBeamsFramePart extends StructuralBuildingFramePart
    with _$GlulamBeamsFramePart {
  GlulamBeamsFramePart._();

  factory GlulamBeamsFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionFractionPercentage}) = _GlulamBeamsFramePart;

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
