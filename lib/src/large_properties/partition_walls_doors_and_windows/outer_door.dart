import 'package:freezed_annotation/freezed_annotation.dart';

part 'outer_door.freezed.dart';

//Sisaltaa tiedot yksittaisten ulko-ovityyppien maarista

@freezed
class OuterDoor with _$OuterDoor {
  const OuterDoor._();

  const factory OuterDoor({
    num? shutDoors,
    num? glassDoors,
    num? accessAndLoadingDoors
  }) = _OuterDoor;

  num? get overallOuterDoors => shutDoors! + glassDoors!;
}