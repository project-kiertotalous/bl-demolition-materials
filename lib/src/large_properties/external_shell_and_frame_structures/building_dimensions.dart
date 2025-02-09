import '../../data_types/cubic_meter.dart';
import '../../data_types/square_meter.dart';

class BuildingDimensions {
  final SquareMeter realFloorAreaGross;
  final CubicMeter realVolume;
  final int floorCountExcludingBasements;
  final SquareMeter realAverageFloorArea;

  BuildingDimensions(
      {required this.realAverageFloorArea,
      required this.realVolume,
      required this.floorCountExcludingBasements,
      required this.realFloorAreaGross});
}
