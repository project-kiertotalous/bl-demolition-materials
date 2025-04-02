import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';

part 'roofs.freezed.dart';
part 'roofs.g.dart';

@freezed
abstract class Roofs with _$Roofs {
  const Roofs._();

  const factory Roofs(
      {num? ceilingArea,
      num? ridgeOrGableRoofPortionPercentage,
      RoofType? ridgeOrGableRoofType,
      WaterRoofType? ridgeOrGableWaterRoofType,
      RoofType? flatOrMonoPitchedRoofType,
      WaterRoofType? flatOrMonoPitchedWaterRoofType,
      @Default(true) bool? useDefaultDimensions,
      @Default(false) bool? roofTrussesAreRecyclable,
      @Default(25) num ridgeOrGableRoofSlopeRatioFactorPercentage,
      @Default(0.10) num flatOrMonoPitchedRoofEaveOverhangAddition}) = _Roofs;

  factory Roofs.fromJson(Map<String, dynamic> json) => _$RoofsFromJson(json);

  num? get flatOrMonoPitchedRoofPortionPercentage =>
      ridgeOrGableRoofPortionPercentage == null
          ? null
          : 1 - Utils.percentageToFraction(ridgeOrGableRoofPortionPercentage)!;
}
