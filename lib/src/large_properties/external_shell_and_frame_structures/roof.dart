import 'package:bl_demolition_materials/src/data_types/roof_type.dart';
import 'package:bl_demolition_materials/src/data_types/water_roof_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roof.freezed.dart';

@freezed
class Roof with _$Roof {
  const factory Roof(
      {required num ceilingArea,
      required num lowerCeilingArea,
      required num ridgeOrGableRoofPortion,
      required RoofType ridgeOrGableRoofType,
      required WaterRoofType ridgeOrGableWaterRoofType,
      required RoofType flatOrMonoPitchedRoofType,
      required WaterRoofType flatOrMonoPitchedWaterRoofType,
      required bool usedDefaultDimensions,
      required bool roofTrussesAreRecyclable}) = _Roof;
}
