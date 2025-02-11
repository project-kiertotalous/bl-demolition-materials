import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class ExcavationArea {
  final SquareMeter areaToRemoveSize;
  final Length areaToRemoveDepth;
  final SquareMeter asphaltArea;
  final Percentage cleanSoilPortion;

  ExcavationArea(
      {required this.areaToRemoveSize,
      required this.areaToRemoveDepth,
      required this.asphaltArea,
      Percentage? cleanSoilPortion})
      : cleanSoilPortion = cleanSoilPortion ?? Percentage.PERCENT_100;

  CubicMeter get volumeToRemove =>
      CubicMeter(areaToRemoveSize.area * areaToRemoveDepth.meters);

  num get contaminatedSoil =>
      100 - (cleanSoilPortion.rawValue) * volumeToRemove.volume;
}
