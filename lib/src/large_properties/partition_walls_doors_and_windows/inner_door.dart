import 'package:freezed_annotation/freezed_annotation.dart';

part 'inner_door.freezed.dart';

//Sisaltaa tiedot yksittaisten sisaovityyppien maarista

@freezed
class InnerDoor with _$InnerDoor {
  const InnerDoor._();

  const factory InnerDoor({
    num? shutDoors,
    num? glassDoors,
  }) = _InnerDoor;

  num? get overallOuterDoors => shutDoors! + glassDoors!;
}