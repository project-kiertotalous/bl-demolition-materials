import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inner_door.freezed.dart';

/// Sisältää tiedot yksittäisten sisäovityyppien määristä
@freezed
abstract class InnerDoor with _$InnerDoor {
  const InnerDoor._();

  const factory InnerDoor({
    num? shutDoors,
    num? glassDoors,
  }) = _InnerDoor;

  num? get overallOuterDoors => Utils.sumOrNull([shutDoors, glassDoors]);
}
