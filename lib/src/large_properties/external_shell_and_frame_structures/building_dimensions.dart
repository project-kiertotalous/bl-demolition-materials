import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data_types/cubic_meter.dart';
import '../../data_types/square_meter.dart';

part 'building_dimensions.freezed.dart';

@freezed
class BuildingDimensions with _$BuildingDimensions {
  factory BuildingDimensions(
      {required SquareMeter realAverageFloorArea,
      required CubicMeter realVolume,
      required int floorCountExcludingBasements,
      required SquareMeter realFloorAreaGross}) = _BuildingDimensions;
}
