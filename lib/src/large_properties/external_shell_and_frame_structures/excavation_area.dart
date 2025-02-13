import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'excavation_area.freezed.dart';

@freezed
class ExcavationArea with _$ExcavationArea {
  const ExcavationArea._();

  const factory ExcavationArea(
          {required SquareMeter areaToRemoveSize,
          required Length areaToRemoveDepth,
          required SquareMeter asphaltArea,
          @Default(Percentage.percentage100) Percentage cleanSoilPortion}) =
      _ExcavationArea;

  CubicMeter get volumeToRemove =>
      CubicMeter(areaToRemoveSize.area * areaToRemoveDepth.meters);

  num get contaminatedSoil =>
      100 - (cleanSoilPortion.rawValue) * volumeToRemove.volume;
}
