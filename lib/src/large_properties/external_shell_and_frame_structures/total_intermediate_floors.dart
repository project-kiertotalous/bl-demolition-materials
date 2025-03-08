import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/intermediate_floors.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total_building_dimensions.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total_foundations.dart';
import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_intermediate_floors.freezed.dart';

@freezed
abstract class TotalIntermediateFloors with _$TotalIntermediateFloors {
  const TotalIntermediateFloors._();

  const factory TotalIntermediateFloors(
      {IntermediateFloors? intermediateFloors,
      TotalBuildingDimensions? totalBuildingDimensions,
      TotalFoundations? totalFoundation}) = _TotalIntermediateFloors;

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
    if (glulamBeamFloorArea == null || totalFoundation == null) {
      return null;
    }

    return glulamBeamFloorArea! *
        totalFoundation!.glulamBeamsIntermediateFloorFrames.kgPerSquareMeter /
        totalFoundation!.glulamBeamsIntermediateFloorFrames.kgPerCubicMeter;
  }

  num? get woodFrameWoodTons => woodFrameFloorArea == null
      ? null
      : woodFrameFloorArea! * DividingWallWeights.woodenTrunkKgPerSqm / 1000;

  num? get glulamBeamWoodTons {
    if (glulamBeamFloorArea == null || totalFoundation == null) {
      return null;
    }

    return glulamBeamFloorArea! *
        totalFoundation!.glulamBeamsIntermediateFloorFrames.kgPerSquareMeter /
        1000;
  }

  num? get concreteCastingConcreteVolume {
    if (concreteCastingFloorArea == null || totalFoundation == null) {
      return null;
    }

    return concreteCastingFloorArea! *
        totalFoundation!
            .concreteCastingIntermediateFloorFrames.kgPerSquareMeter /
        totalFoundation!.concreteCastingIntermediateFloorFrames.kgPerCubicMeter;
  }

  num? get hollowCoreSlabConcreteVolume => hollowCoreSlabFloorArea == null
      ? null
      : hollowCoreSlabFloorArea! *
          FoundationWeights.hollowSlab200mmKgPerSqm /
          FoundationWeights.hollowSlab200mmKgPerCbm;

  num? get concreteCastingConcreteTons {
    if (concreteCastingFloorArea == null || totalFoundation == null) {
      return null;
    }

    return concreteCastingFloorArea! *
        totalFoundation!
            .concreteCastingIntermediateFloorFrames.kgPerSquareMeter /
        1000;
  }

  num? get hollowCoreSlabConcreteTons => hollowCoreSlabFloorArea == null
      ? null
      : hollowCoreSlabFloorArea! *
          FoundationWeights.hollowSlab200mmKgPerSqm /
          1000;

  num? get concreteCastingSteelTons => concreteCastingConcreteVolume == null
      ? null
      : concreteCastingConcreteVolume! *
          FoundationWeights.reinforcedConcreteColumn250x250KgPerSqm /
          1000;
}
