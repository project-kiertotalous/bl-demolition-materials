import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';

part 'outer_door.freezed.dart';
part 'outer_door.g.dart';

/// Sisältää tiedot yksittäisten ulko-ovityyppien määristä
@freezed
abstract class OuterDoor with _$OuterDoor {
  const OuterDoor._();

  const factory OuterDoor({num? shutDoors, num? glassDoors}) = _OuterDoor;

  factory OuterDoor.fromJson(Map<String, dynamic> json) =>
      _$OuterDoorFromJson(json);

  num? get overallOuterDoors => Utils.sumOrNull([shutDoors, glassDoors]);
}
