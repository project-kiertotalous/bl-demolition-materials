import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'excavation_area.freezed.dart';

@freezed
class ExcavationArea with _$ExcavationArea {
  const ExcavationArea._();

  const factory ExcavationArea(
      {num? areaToRemoveSize,
      num? areaToRemoveDepth,
      num? asphaltArea,
      @Default(100) num cleanSoilPortionPercentageFraction}) = _ExcavationArea;

  num? get volumeToRemove {
    if (areaToRemoveSize == null || areaToRemoveDepth == null) {
      return null;
    }

    return areaToRemoveSize! * areaToRemoveDepth!;
  }

  num? get contaminatedSoil {
    if (volumeToRemove == null) {
      return null;
    }

    return (1 - cleanSoilPortionPercentageFraction) * volumeToRemove!;
  }

  num? get cleanLandTons {
    if (volumeToRemove == null) {
      return null;
    }

    return volumeToRemove! *
        cleanSoilPortionPercentageFraction *
        YardStructureWeights.soilToRemoveDensityKgPerCbm /
        1000;
  }

  num? get contaminatedLandTons {
    if (volumeToRemove == null) {
      return null;
    }

    return (1 - cleanSoilPortionPercentageFraction) *
        volumeToRemove! *
        YardStructureWeights.soilToRemoveDensityKgPerCbm;
  }

  num? get asphaltTons {
    if (asphaltArea == null) {
      return null;
    }

    return asphaltArea! * YardStructureWeights.asphaltWeightKgPerSqm / 1000;
  }

  num? get asphaltVolume {
    if (asphaltArea == null) {
      return null;
    }

    return asphaltArea! *
        YardStructureWeights.asphaltWeightKgPerSqm /
        YardStructureWeights.asphaltDensityKgPerCbm;
  }
}
