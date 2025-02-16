import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data_types/cellar_exterior_material.dart';

part 'cellar.freezed.dart';

@freezed
class Cellar with _$Cellar {
  const factory Cellar(
      {num? floorArea,
      num? exteriorWallsPerimeter,
      num? wallHeight,
      CellarExteriorMaterial? exteriorWallsMaterial}) = _Cellar;

  // TODO: Material info needs to be done first

  num? get concreteDemolitionVolume => i7 + i11 + i14 + i17 + i20;

  num? get concreteDemolitionTons => k7 + k11 + k14 + j17 + j20;

  num? get rebarTons => l7 + l11 + l14;

  num? get brickVolume => i16;

  num? get brickTons => j16;

  num? get blockVolume => i19;

  num? get blockTons => j19;

  num? get glassAndMineralWoolInsulationVolume => i9;

  num? get glassAndMineralWoolInsulationTons => j9;

  num? get plasticWasteVolume => i10 + i12 + i22 + i23 + i24 + i25;

  num? get plasticWasteTons => j10 + j12 + j22 + j23 + j24 + j25;

  num? get hotBitumenCoatingVolume => i8 + i26;

  num? get hotBitumenCoatingTons => j8 + j26;

  num? get i7 => floorArea == null ? null : 0.1 * floorArea!;
  num? get i8 => floorArea == null
      ? null
      : CellarStructureWeights.hotBitumenCoatingWeightKgPerSqm *
          floorArea! /
          CellarStructureWeights.hotBitumenCoatingDensityKgPerCbm;

  num? get i9 => 0;
  num? get i10 => 0;
  num? get i11 => 0;
  num? get i12 => 0;
  num? get i14 => 0;
  num? get i16 => 0;
  num? get i17 => 0;
  num? get i19 => 0;
  num? get i20 => 0;
  num? get i22 => 0;
  num? get i23 => 0;
  num? get i24 => 0;
  num? get i25 => 0;
  num? get i26 => 0;
  num? get k7 => 0;
  num? get k11 => 0;
  num? get k14 => 0;
  num? get j8 => 0;
  num? get j9 => 0;
  num? get j10 => 0;
  num? get j12 => 0;
  num? get j16 => 0;
  num? get j17 => 0;
  num? get j19 => 0;
  num? get j20 => 0;
  num? get j22 => 0;
  num? get j23 => 0;
  num? get j24 => 0;
  num? get j25 => 0;
  num? get j26 => 0;
  num? get l7 => 0;
  num? get l11 => 0;
  num? get l14 => 0;
}
