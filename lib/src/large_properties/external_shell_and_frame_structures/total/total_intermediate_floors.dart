import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import '../../../utils/utils.dart';

part 'total_intermediate_floors.freezed.dart';

@freezed
abstract class TotalIntermediateFloors with _$TotalIntermediateFloors {
  const TotalIntermediateFloors._();

  const factory TotalIntermediateFloors(
      {IntermediateFloors? intermediateFloors,
      TotalBuildingDimensions? totalBuildingDimensions,
      Foundations? foundations}) = _TotalIntermediateFloors;

  num? get woodFramePercentageFraction =>
      intermediateFloors?.woodFramePercentageFraction;

  num? get concreteCastingPercentageFraction =>
      intermediateFloors?.concreteCastingPercentageFraction;

  num? get hollowCoreSlabPercentageFraction =>
      intermediateFloors?.hollowCoreSlabPercentageFraction;

  num? get glulamBeamPercentageFraction =>
      intermediateFloors?.glulamBeamPercentageFraction;

  bool? get hollowCoreSlabsAndGlulamBeamRecyclable =>
      intermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable;

  num? get totalFraction => intermediateFloors?.totalFraction;

  num? get woodFrameFloorArea => Utils.multiplyOrNull([
        woodFramePercentageFraction,
        totalBuildingDimensions?.grossFloorAreaExcludingCellars
      ]);

  num? get concreteCastingFloorArea => Utils.multiplyOrNull([
        concreteCastingPercentageFraction,
        totalBuildingDimensions?.grossFloorAreaExcludingCellars
      ]);

  num? get hollowCoreSlabFloorArea => Utils.multiplyOrNull([
        hollowCoreSlabPercentageFraction,
        totalBuildingDimensions?.grossFloorAreaExcludingCellars
      ]);

  num? get glulamBeamFloorArea => Utils.multiplyOrNull([
        glulamBeamPercentageFraction,
        totalBuildingDimensions?.grossFloorAreaExcludingCellars
      ]);

  num? get totalFloorArea => Utils.sumOrNull([
        woodFrameFloorArea,
        concreteCastingFloorArea,
        hollowCoreSlabFloorArea,
        glulamBeamFloorArea
      ]);

  num? get woodFrameWoodVolume => woodFrameFloorArea == null
      ? null
      : woodFrameFloorArea! *
          DividingWallWeights.woodenTrunkKgPerSqm /
          DividingWallWeights.woodenTrunkKgPerCbm;

  num? get glulamBeamWoodVolume {
    if (glulamBeamFloorArea == null || foundations == null) {
      return null;
    }

    return glulamBeamFloorArea! *
        foundations!.glulamBeamsIntermediateFloorFrames.kgPerSquareMeter /
        foundations!.glulamBeamsIntermediateFloorFrames.kgPerCubicMeter;
  }

  num? get woodFrameWoodTons => woodFrameFloorArea == null
      ? null
      : woodFrameFloorArea! * DividingWallWeights.woodenTrunkKgPerSqm / 1000;

  num? get glulamBeamWoodTons {
    if (glulamBeamFloorArea == null || foundations == null) {
      return null;
    }

    return glulamBeamFloorArea! *
        foundations!.glulamBeamsIntermediateFloorFrames.kgPerSquareMeter /
        1000;
  }

  num? get concreteCastingConcreteVolume {
    if (concreteCastingFloorArea == null || foundations == null) {
      return null;
    }

    return concreteCastingFloorArea! *
        foundations!.concreteCastingIntermediateFloorFrames.kgPerSquareMeter /
        foundations!.concreteCastingIntermediateFloorFrames.kgPerCubicMeter;
  }

  num? get hollowCoreSlabConcreteVolume => hollowCoreSlabFloorArea == null
      ? null
      : hollowCoreSlabFloorArea! *
          FoundationWeights.hollowSlab200mmKgPerSqm /
          FoundationWeights.hollowSlab200mmKgPerCbm;

  num? get concreteCastingConcreteTons {
    if (concreteCastingFloorArea == null || foundations == null) {
      return null;
    }

    return concreteCastingFloorArea! *
        foundations!.concreteCastingIntermediateFloorFrames.kgPerSquareMeter /
        1000;
  }

  num? get hollowCoreSlabConcreteTons => hollowCoreSlabFloorArea == null
      ? null
      : hollowCoreSlabFloorArea! *
          FoundationWeights.hollowSlab200mmKgPerSqm /
          1000;

  num? get concreteCastingRebarTons => concreteCastingConcreteVolume == null
      ? null
      : concreteCastingConcreteVolume! *
          FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm /
          1000;
}
