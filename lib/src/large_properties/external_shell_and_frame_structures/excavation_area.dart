import 'package:freezed_annotation/freezed_annotation.dart';

part 'excavation_area.freezed.dart';

@freezed
class ExcavationArea with _$ExcavationArea {
  const ExcavationArea._();

  const factory ExcavationArea(
      {required num areaToRemoveSize,
      required num areaToRemoveDepth,
      required num asphaltArea,
      @Default(100) num cleanSoilPortionPercentage}) = _ExcavationArea;

  num get volumeToRemove => areaToRemoveSize * areaToRemoveDepth;

  num get contaminatedSoil => (100 - cleanSoilPortionPercentage) * volumeToRemove;
}
