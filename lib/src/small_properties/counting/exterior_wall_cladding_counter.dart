import 'package:bl_demolition_materials/src/small_properties/foundations_and_outer_shell/foundations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:bl_demolition_materials/src/data_types/wall_material.dart';

part 'exterior_wall_cladding_counter.freezed.dart';

/// Laskenta
/// Ulkoseinien verhoukset
@freezed
class ExteriorWallCladdingCounter with _$ExteriorWallCladdingCounter {
  ExteriorWallCladdingCounter._();

  const factory ExteriorWallCladdingCounter({
    required ExteriorWallCladding exteriorWallCladding,
  }) = _ExteriorWallCladdingCounter;
}
