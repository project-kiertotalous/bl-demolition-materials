import 'package:freezed_annotation/freezed_annotation.dart';

part 'intermediate_floors.freezed.dart';
part 'intermediate_floors.g.dart';

@freezed
abstract class IntermediateFloors with _$IntermediateFloors {
  const IntermediateFloors._();

  const factory IntermediateFloors(
          {num? woodFramePercentage,
          num? concreteCastingPercentage,
          num? hollowCoreSlabPercentage,
          num? glulamBeamPercentage,
          @Default(false) bool hollowCoreSlabsAndGlulamBeamRecyclable}) =
      _IntermediateFloors;

  factory IntermediateFloors.fromJson(Map<String, dynamic> json) =>
      _$IntermediateFloorsFromJson(json);

  num get totalPercentage =>
      (woodFramePercentage ?? 0) +
      (concreteCastingPercentage ?? 0) +
      (hollowCoreSlabPercentage ?? 0) +
      (glulamBeamPercentage ?? 0);
}
