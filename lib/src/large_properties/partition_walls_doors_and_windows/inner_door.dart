import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';

part 'inner_door.freezed.dart';
part 'inner_door.g.dart';

/// Sisältää tiedot yksittäisten sisäovityyppien määristä
@freezed
abstract class InnerDoor with _$InnerDoor {
  const InnerDoor._();

  const factory InnerDoor({
    num? shutDoors,
    num? glassDoors,
  }) = _InnerDoor;

  factory InnerDoor.fromJson(Map<String, dynamic> json) =>
      _$InnerDoorFromJson(json);

  num? get overallOuterDoors => Utils.sumOrNull([shutDoors, glassDoors]);
}
