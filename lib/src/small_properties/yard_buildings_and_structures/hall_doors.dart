import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';

import '../../utils/utils.dart';

part 'hall_doors.freezed.dart';

/// Halliovet
/// Sisältää tiedot kaikkien halliovien materiaalimäärista yhteensä
@freezed
abstract class HallDoors with _$HallDoors {
  const HallDoors._();

  const factory HallDoors({
    num? woodenDoors,
    num? aluminiumDoors,
    num? steelDoors,
    @Default(false) bool areHallDoorsRecyclable,
  }) = _HallDoors;

  /// Puuovi (tonnia)
  num? get woodenDoorTons {
    num? multiply = Utils.multiplyOrNull([
      woodenDoors,
      YardStructureWeights.woodenLiftDoorsAndBigPassageDoors3x5mKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Alumiiniovi (tonnia)
  num? get aluminiumDoorTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumDoors,
      YardStructureWeights.aluminiumLiftDoorsAndBigPassageDoors3x5mKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Teräsovi (tonnia)
  num? get steelDoorTons {
    num? multiply = Utils.multiplyOrNull([
      steelDoors,
      YardStructureWeights.steelLiftDoorsAndBigPassageDoors3x5mKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }
}
