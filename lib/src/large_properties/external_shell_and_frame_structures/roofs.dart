import 'package:bl_demolition_materials/src/data_types/roof_type.dart';
import 'package:bl_demolition_materials/src/data_types/water_roof_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roofs.freezed.dart';

@freezed
abstract class Roofs with _$Roofs {
  const Roofs._();

  const factory Roofs(
      {required num? ceilingArea,
      required num? ridgeOrGableRoofPortion,
      required RoofType? ridgeOrGableRoofType,
      required WaterRoofType? ridgeOrGableWaterRoofType,
      required RoofType? flatOrMonoPitchedRoofType,
      required WaterRoofType? flatOrMonoPitchedWaterRoofType,
      @Default(true) bool? useDefaultDimensions,
      @Default(false) bool? roofTrussesAreRecyclable,
      @Default(0.25) num ridgeOrGableRoofSlopeRatioFactorFractionPercentage,
      @Default(0.10) flatOrMonoPitchedRoofEaveOverhangAddition}) = _Roofs;

  num? get flatOrMonoPitchedRoofPortion =>
      ridgeOrGableRoofPortion == null ? null : 1 - ridgeOrGableRoofPortion!;
}
