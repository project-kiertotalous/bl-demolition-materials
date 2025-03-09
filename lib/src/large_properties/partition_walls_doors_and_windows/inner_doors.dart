import 'package:freezed_annotation/freezed_annotation.dart';

import '../material_info.dart';
import 'inner_door.dart';

part 'inner_doors.freezed.dart';

// Sisaovet
// Sisaltaa tiedot kaikkien sisaovien materiaalimaarista yhteensa

@freezed
class InnerDoors with _$InnerDoors {
  const InnerDoors._();

  const factory InnerDoors(InnerDoor? slabDoors,
      {InnerDoor? woodenDoors,
      InnerDoor? fireDoors,
      @Default(false) bool areDoorsRecyclable}) = _InnerDoors;

  num? get totalWoodenMaterialVolume =>
      ((slabDoors?.shutDoors ?? 0) +
          (slabDoors?.glassDoors ?? 0) +
          (woodenDoors?.shutDoors ?? 0) +
          (woodenDoors?.glassDoors ?? 0)) *
      DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
      DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm;

  num? get totalGlassMaterialVolume =>
      ((slabDoors?.glassDoors ?? 0) + (woodenDoors?.glassDoors ?? 0)) *
      DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg /
      1000;

  num? get totalWoodMaterialTons =>
      ((slabDoors?.shutDoors ?? 0) +
          (slabDoors?.glassDoors ?? 0) +
          (woodenDoors?.shutDoors ?? 0) +
          (woodenDoors?.glassDoors ?? 0)) *
      DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
      1000;

  num? get totalGlassMaterialTons =>
      ((slabDoors?.glassDoors ?? 0) + (woodenDoors?.glassDoors ?? 0)) *
      DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg /
      DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm;

  num? get totalSteelMaterialTons =>
      (fireDoors?.shutDoors ?? 0) * DoorWeights.steelDoorClosedFireDoorKg / 1000;
}
