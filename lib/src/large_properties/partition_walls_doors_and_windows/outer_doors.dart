import 'package:freezed_annotation/freezed_annotation.dart';

import '../material_info.dart';
import 'outer_door.dart';

part 'outer_doors.freezed.dart';

// Ulko-ovet
// Sisaltaa tiedot kaikkien ulko-ovien materiaalimaarista yhteensa

@freezed
class OuterDoors with _$OuterDoors {
  const OuterDoors._();

  const factory OuterDoors(
      {OuterDoor? woodenDoors,
      OuterDoor? aluminiumDoors,
      OuterDoor? steelDoors,
      @Default(false) bool areDoorsRecyclable}) = _OuterDoors;

  num? get totalWoodenMaterialVolume =>
      (woodenDoors?.shutDoors ?? 0) *
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg /
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm +
      (woodenDoors?.glassDoors ?? 0) *
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg /
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm;

  num? get totalGlassMaterialVolume =>
      ((woodenDoors?.glassDoors ?? 0) *
              DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg +
          (aluminiumDoors?.glassDoors ?? 0) *
              DoorWeights.aluminiumDoorWithGlassGlassKg +
          (steelDoors?.glassDoors ?? 0) * DoorWeights.steelDoorWithGlass05SqmGlassKg +
          (woodenDoors?.accessAndLoadingDoors ?? 0) *
              DoorWeights.metallicLiftDoorsAndBigPassageDoorsGlassKg) /
      DoorWeights.woodenOuterDoor210x80WithGlass05SqmGlassKgPerCbm;

  num? get totalWoodMaterialTons =>
      (woodenDoors?.shutDoors ?? 0) *
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg /
          1000 +
      (woodenDoors?.glassDoors ?? 0) *
          DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
          1000;

  num? get totalAluminiumMaterialTons =>
      ((aluminiumDoors?.shutDoors ?? 0) * DoorWeights.aluminiumDoorWithGlassGlassKg +
          (aluminiumDoors?.glassDoors ?? 0) *
              DoorWeights.aluminiumDoorWithGlassGlassKg) /
      1000;

  num? get totalSteelMaterialTons =>
      ((steelDoors?.shutDoors ?? 0) * DoorWeights.steelDoorClosedFireDoorKg +
          (steelDoors?.glassDoors ?? 0) * DoorWeights.steelDoorWithGlass05SqmGlassKg +
          (woodenDoors?.accessAndLoadingDoors ?? 0) *
              DoorWeights.metallicLiftDoorsAndBigPassageDoorsKg) /
      1000;

  num? get totalGlassMaterialTons =>
      ((woodenDoors?.glassDoors ?? 0) *
              DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg +
          (aluminiumDoors?.glassDoors ?? 0) *
              DoorWeights.aluminiumDoorWithGlassGlassKg +
          (steelDoors?.glassDoors ?? 0) *
              DoorWeights.steelDoorWithGlass05SqmGlassKg) /
      1000;
}
