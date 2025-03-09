import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'windows.freezed.dart';

// Ikkunat

@freezed
class Windows with _$Windows {
  const Windows._();

  const factory Windows({
    num? windowsPcs,
    num? windowsArea,
    num? glassWallArea,
    @Default(false) bool areWindowsRecyclable
  }) = _Windows;

  num? get totalGlassArea => windowsPcs! * windowsArea!;

  num? get totalWoodenMaterialVolume => (totalGlassArea ?? 0) * (WindowWeights.lowerFramePaintedKgPerSqm + WindowWeights.frame175mmKgPerSqm) / WindowWeights.lowerFramePaintedKgPerCbm;

  num? get totalGlassMaterialVolume => ((totalGlassArea ?? 0) + (glassWallArea ?? 0)) * WindowWeights.threeTimesClosedGlassKgPerSqm / WindowWeights.lowerFramePaintedKgPerSqm;

  num? get totalWoodenMaterialTons => (totalGlassArea ?? 0) * (WindowWeights.lowerFramePaintedKgPerSqm + WindowWeights.frame175mmKgPerSqm) / 1000;

  num? get totalAluminiumMaterialTons => (totalGlassArea ?? 0) * WindowWeights.outerListsAluminiumKgPerSqm / 1000;

  num? get totalGlassMaterialTons => ((totalGlassArea ?? 0) + (glassWallArea ?? 0)) * WindowWeights.threeTimesClosedGlassKgPerSqm / 1000;
}