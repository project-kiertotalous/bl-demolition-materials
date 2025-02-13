import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_dimensions.freezed.dart';

@freezed
class BuildingDimensions with _$BuildingDimensions {
  const factory BuildingDimensions(
      {required num realAverageFloorArea,
      required num realVolume,
      required int floorCountExcludingBasements,
      required num realFloorAreaGross}) = _BuildingDimensions;
}
