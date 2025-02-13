import 'package:freezed_annotation/freezed_annotation.dart';

part 'interfloor.freezed.dart';

@freezed
class Interfloor with _$Interfloor {
  const factory Interfloor(
      {required num woodFrameArea,
      required num pouredConcreteArea,
      required num hollowCoreSlabArea,
      required num glulamBeamArea,
      required bool hollowCoreSlabsAndGlulamBeamRecycleable}) = _Interfloor;
}
