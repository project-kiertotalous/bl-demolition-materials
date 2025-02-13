import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';

part 'interfloor.freezed.dart';

@freezed
class Interfloor with _$Interfloor {
  const factory Interfloor(
      {required SquareMeter woodFrame,
      required SquareMeter pouredConcrete,
      required SquareMeter hollowCoreSlab,
      required double glulamBeam,
      required bool hollowCoreSlabsAndGlulamBeamRecycleable}) = _Interfloor;
}
