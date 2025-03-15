import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outer_door.freezed.dart';

/// Sisältää tiedot yksittäisten ulko-ovityyppien määristä
@freezed
class OuterDoor with _$OuterDoor {
  const OuterDoor._();

  const factory OuterDoor(
      {num? shutDoors,
      num? glassDoors,
      num? accessAndLoadingDoors}) = _OuterDoor;

  num? get overallOuterDoors => Utils.sumOrNull([shutDoors, glassDoors]);
}
