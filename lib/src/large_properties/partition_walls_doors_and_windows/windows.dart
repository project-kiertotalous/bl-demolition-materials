import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'windows.freezed.dart';

// Ikkunat

@freezed
class Windows with _$Windows {
  const Windows._();

  const factory Windows(
      {num? windowsPcs,
      num? windowsArea,
      num? glassWallArea,
      @Default(false) bool areWindowsRecyclable}) = _Windows;

  num? get totalGlassArea {
    if (Utils.anyNull([windowsPcs, windowsArea])) {
      return null;
    }
    return windowsPcs! * windowsArea!;
  }

  num? get totalWoodenMaterialVolume {
    if (totalGlassArea == null) {
      return null;
    }
    return totalGlassArea! *
        (WindowWeights.lowerFramePaintedKgPerSqm +
            WindowWeights.frame175mmKgPerSqm) /
        WindowWeights.lowerFramePaintedKgPerCbm;
  }

  num? get totalGlassMaterialVolume {
    if (Utils.allNull([totalGlassArea, glassWallArea])) {
      return null;
    }
    return Utils.sumOrNull([totalGlassArea, glassWallArea])! *
        WindowWeights.threeTimesClosedGlassKgPerSqm /
        WindowWeights.lowerFramePaintedKgPerSqm;
  }

  num? get totalWoodenMaterialTons {
    if (totalGlassArea == null) {
      return null;
    }
    return totalGlassArea! *
        (WindowWeights.lowerFramePaintedKgPerSqm +
            WindowWeights.frame175mmKgPerSqm) /
        1000;
  }

  num? get totalAluminiumMaterialTons {
    if (totalGlassArea == null) {
      return null;
    }
    return totalGlassArea! * WindowWeights.outerListsAluminiumKgPerSqm / 1000;
  }

  num? get totalGlassMaterialTons {
    if (Utils.allNull([totalGlassArea, glassWallArea])) {
      return null;
    }
    return Utils.sumOrNull([totalGlassArea, glassWallArea])! *
        WindowWeights.threeTimesClosedGlassKgPerSqm /
        1000;
  }
}