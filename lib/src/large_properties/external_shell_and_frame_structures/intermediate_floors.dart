import 'package:freezed_annotation/freezed_annotation.dart';

part 'intermediate_floors.freezed.dart';

@freezed
abstract class IntermediateFloors with _$IntermediateFloors {
  const IntermediateFloors._();

  const factory IntermediateFloors(
          {num? woodFramePercentageFraction,
          num? concreteCastingPercentageFraction,
          num? hollowCoreSlabPercentageFraction,
          num? glulamBeamPercentageFraction,
          @Default(false) bool hollowCoreSlabsAndGlulamBeamRecyclable}) =
      _IntermediateFloors;

  num get totalFraction =>
      (woodFramePercentageFraction ?? 0) +
      (concreteCastingPercentageFraction ?? 0) +
      (hollowCoreSlabPercentageFraction ?? 0) +
      (glulamBeamPercentageFraction ?? 0);
}
