import '../../../../../bl_demolition_materials.dart';
import '../../../../utils/utils.dart';

abstract class BuildingFramePart {
  final num? portionFractionPercentage;

  final TotalBuildingFrame? totalBuildingFrame;

  BuildingFramePart({this.totalBuildingFrame, this.portionFractionPercentage});

  num? get area => Utils.multiplyOrNull([
        totalBuildingFrame?.externalWallsPerimeter,
        totalBuildingFrame?.externalWallsHeight,
        portionFractionPercentage
      ]);
}
