import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../material_info.dart';
import 'outer_door.dart';

part 'outer_doors.freezed.dart';

/// Ulko-ovet
/// Sisältää tiedot kaikkien ulko-ovien materiaalimääristä yhteensä
@freezed
class OuterDoors with _$OuterDoors {
  const OuterDoors._();

  const factory OuterDoors(
      {OuterDoor? woodenDoors,
      OuterDoor? aluminiumDoors,
      OuterDoor? steelDoors,
      @Default(false) bool areDoorsRecyclable}) = _OuterDoors;

  num? get totalWoodenMaterialVolume {
    final allNulls =
        Utils.allNull([woodenDoors?.shutDoors, woodenDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
      (Utils.multiplyOrNull([
            woodenDoors?.shutDoors,
            DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg
          ]) ??
          0 /
              DoorWeights
                  .woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm),
      (Utils.multiplyOrNull([
            woodenDoors?.glassDoors,
            DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg
          ]) ??
          0 /
              DoorWeights
                  .woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm)
    ]);
  }

  num? get totalGlassMaterialVolume {
    final allNulls = Utils.allNull([
      woodenDoors?.glassDoors,
      aluminiumDoors?.glassDoors,
      steelDoors?.glassDoors,
      woodenDoors?.accessAndLoadingDoors
    ]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
          (Utils.multiplyOrNull([
            woodenDoors?.glassDoors,
            DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg
          ])),
          (Utils.multiplyOrNull([
            aluminiumDoors?.glassDoors,
            DoorWeights.aluminiumDoorWithGlassGlassKg
          ])),
          (Utils.multiplyOrNull([
            steelDoors?.glassDoors,
            DoorWeights.steelDoorWithGlass05SqmGlassKg
          ])),
          (Utils.multiplyOrNull([
            woodenDoors?.accessAndLoadingDoors,
            DoorWeights.metallicLiftDoorsAndBigPassageDoorsGlassKg
          ]))
        ])! /
        DoorWeights.woodenOuterDoor210x80WithGlass05SqmGlassKgPerCbm;
    return result;
  }

  num? get totalWoodMaterialTons {
    final allNulls =
        Utils.allNull([woodenDoors?.shutDoors, woodenDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
      (Utils.multiplyOrNull([
            woodenDoors?.shutDoors,
            DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg
          ]) ??
          0 / 1000),
      (Utils.multiplyOrNull([
            woodenDoors?.glassDoors,
            DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg
          ]) ??
          0 / 1000)
    ]);
    return result;
  }

  num? get totalAluminiumMaterialTons {
    final allNulls =
        Utils.allNull([aluminiumDoors?.shutDoors, aluminiumDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
          (Utils.multiplyOrNull([
            aluminiumDoors?.shutDoors,
            DoorWeights.aluminiumDoorWithGlassGlassKg
          ])),
          (Utils.multiplyOrNull([
            aluminiumDoors?.glassDoors,
            DoorWeights.aluminiumDoorWithGlassGlassKg
          ]))
        ])! /
        1000;
    return result;
  }

  num? get totalSteelMaterialTons {
    final allNulls =
        Utils.allNull([steelDoors?.shutDoors, steelDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
          (Utils.multiplyOrNull(
              [steelDoors?.shutDoors, DoorWeights.steelDoorClosedFireDoorKg])),
          (Utils.multiplyOrNull([
            steelDoors?.glassDoors,
            DoorWeights.steelDoorWithGlass05SqmGlassKg
          ])),
          (Utils.multiplyOrNull([
            woodenDoors?.accessAndLoadingDoors,
            DoorWeights.metallicLiftDoorsAndBigPassageDoorsKg
          ]))
        ])! /
        1000;
    return result;
  }

  num? get totalGlassMaterialTons {
    final allNulls = Utils.allNull([
      woodenDoors?.glassDoors,
      aluminiumDoors?.glassDoors,
      steelDoors?.glassDoors
    ]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
          (Utils.multiplyOrNull([
            woodenDoors?.glassDoors,
            DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg
          ])),
          (Utils.multiplyOrNull([
            aluminiumDoors?.glassDoors,
            DoorWeights.aluminiumDoorWithGlassGlassKg
          ])),
          (Utils.multiplyOrNull([
            steelDoors?.glassDoors,
            DoorWeights.steelDoorWithGlass05SqmGlassKg
          ]))
        ])! /
        1000;
    return result;
  }
}
