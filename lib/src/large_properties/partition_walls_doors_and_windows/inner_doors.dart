import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../material_info.dart';
import 'inner_door.dart';

part 'inner_doors.freezed.dart';

/// Sisäovet
/// Sisältää tiedot kaikkien sisäovien materiaalimäärista yhteensä
@freezed
class InnerDoors with _$InnerDoors {
  const InnerDoors._();

  const factory InnerDoors(InnerDoor? slabDoors,
      {InnerDoor? woodenDoors,
      InnerDoor? fireDoors,
      @Default(false) bool areDoorsRecyclable}) = _InnerDoors;

  num? get totalWoodenMaterialVolume {
    final allNulls = Utils.sumOrNull([
      slabDoors?.shutDoors,
      slabDoors?.glassDoors,
      woodenDoors?.shutDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == 0) {
      return null;
    }
    final result = allNulls! *
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm;
    return result;
  }

  num? get totalGlassMaterialVolume {
    final allNulls = Utils.sumOrNull([
      slabDoors?.glassDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == 0) {
      return null;
    }
    final result =
        allNulls! * DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg / 1000;
    return result;
  }

  num? get totalWoodMaterialTons {
    final allNulls = Utils.sumOrNull([
      slabDoors?.shutDoors,
      slabDoors?.glassDoors,
      woodenDoors?.shutDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == 0) {
      return null;
    }
    final result = allNulls! *
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
        1000;
    return result;
  }

  num? get totalGlassMaterialTons {
    final allNulls = Utils.sumOrNull([
      slabDoors?.glassDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == 0) {
      return null;
    }
    final result = allNulls! *
        DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg /
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm;
    return result;
  }

  num? get totalSteelMaterialTons {
    if (fireDoors?.shutDoors == null) {
      return null;
    }
    final result =
        fireDoors!.shutDoors! * DoorWeights.steelDoorClosedFireDoorKg / 1000;
    return result;
  }
}
