import 'package:bl_demolition_materials/src/data_types/foundation_material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';

part 'foundation.freezed.dart';

@freezed
class Foundation with _$Foundation {
  const Foundation._();

  const factory Foundation(
      {required SquareMeter area,
      required Length circumference,
      Material? material}) = _Foundation;

  num get areaValue => area.area;
}
