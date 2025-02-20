import '../large_properties/material_info.dart';
import '../large_properties/external_shell_and_frame_structures/cellar.dart';

enum CellarExteriorMaterial { concreteCasting, concreteBlock, brick }

class GroundFloorMaterial {
  static num ferroConcreteTileLengthThicknessMm = 100;
  static final num ferroConcreteTileKgInSqm = ferroConcreteTileLengthThicknessMm / 1000 * ferroConcreteTileKgInSqm;
  static final num ferroConcreteTileKgInCbm = FoundationWeights.steelConcreteCastKgPerCbm;
  static final num ferroConcreteTileSteelKgInCbm = FoundationWeights.steelConcreteCastSteelKgPerCbm;
  static final num ferroConcreteTileMaterialKgInCbm = ferroConcreteTileLengthThicknessMm / 1000 * Cellar.floorArea;
  static final num ferroConcreteTileMaterialInTons = ferroConcreteTileMaterialKgInCbm * ferroConcreteTileKgInCbm / 1000;
  static final num ferroConcreteTileConcreteInTons = ferroConcreteTileMaterialInTons - ferroConcreteTileSteelInTons;
  static final num ferroConcreteTileSteelInTons = FoundationWeights.steelConcreteSilt250x250SteelKgPerCbm / 1000;
  static final num hotBitiumBrushingKgPerSqm = FoundationSlabWeights.hotBitiumBrushingKgPerSqm;
  static final num hotBitiumBrushingKgPerCbm = FoundationSlabWeights.hotBitiumBrushingKgPerCbm;
  static final num hotBitiumBrushingMaterialKgInCbm = hotBitiumBrushingKgPerSqm * Cellar.floorArea / hotBitiumBrushingKgPerCbm;
  static final num hotBitiumBrushingMaterialInTons = hotBitiumBrushingMaterialKgInCbm * Cellar.floorArea / 1000;
  static num mineralWoolLengthThicknessInMm = 100;
  static final num mineralWoolKgPerSqm = ExteriorWallWeights.mineralWool100mmKgPerSqm / 100 * mineralWoolInMm;
  static final num mineralWoolKgPerCbm = ExteriorWallWeights.mineralWool100mmKgPerCbm / 100 * mineralWoolInMm;
  static final num mineralWoolMaterialKgInCbm = mineralWoolKgPerSqm * Cellar.floorArea / mineralWoolKgPerCbm;
  static final num mineralWoolMaterialInTons = mineralWoolMaterialKgInCbm * Cellar.floorArea / 1000;
  static num styroxRLengthThicknessInMm = 100;
  static final num styroxRKgPerSqm = FoundationSlabWeights.styrox120mmKgPerSqm / 100 * styroxRInMm;
  static final num styroxRKgPerCbm = FoundationSlabWeights.styrox120mmKgPerCbm / 100 * styroxRInMm;
  static final num styroxRMaterialKgInCbm = styroxRKgPerSqm * Cellar.floorArea / styroxRKgPerCbm;
  static final num styroxRMaterialInTons = styroxRKgPerSqm * Cellar.floorArea / 1000;
  static num ferroConcreteSiltLengthThicknessInMm = 100;
  static final num ferroConcreteSiltKgInSqm = ferroConcreteSiltLengthThicknessInMm / 1000 * ferroConcreteSiltKgInSqm;
  static final num ferroConcreteSiltKgInCbm = FoundationWeights.steelConcreteCastKgPerCbm;
  static final num ferroConcreteSiltSteelKgInCbm = FoundationWeights.steelConcreteCastSteelKgPerCbm;
}
