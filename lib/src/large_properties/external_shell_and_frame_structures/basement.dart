import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../data_types/foundation_material.dart';

part 'basement.freezed.dart';

@freezed
class Basement with _$Basement {
  const factory Basement(
      {required SquareMeter floorArea,
      required Length circumference,
      required Length height,
      required Material material}) = _Basement;
}
