import 'package:freezed_annotation/freezed_annotation.dart';

part 'passage_door.freezed.dart';

/// Sisältää tiedot yksittäisten kulkuovityyppien määristä
@freezed
abstract class PassageDoor with _$PassageDoor {
  const PassageDoor._();

  const factory PassageDoor({
    num? shutDoors,
    num? glassDoors,
  }) = _PassageDoor;
}
