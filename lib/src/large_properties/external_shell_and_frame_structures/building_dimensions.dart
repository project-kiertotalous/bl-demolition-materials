import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_dimensions.freezed.dart';

@freezed
abstract class BuildingDimensions with _$BuildingDimensions {
  const factory BuildingDimensions(
      {num? grossFloorArea,
      num? volume,
      int? floorCountExcludingCellars,
      num? averageArea}) = _BuildingDimensions;
}
