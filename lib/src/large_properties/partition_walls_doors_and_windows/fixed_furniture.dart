import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixed_furniture.freezed.dart';

@freezed
class FixedFurniture with _$FixedFurniture {
  const factory FixedFurniture(
      {@Default(false) bool areFurnituresRecyclable,
      num? toiletSeats,
      num? porcelainSinks,
      num? steelTables,
      num? kitchenClosetsWoodOrChipboard,
      num? dressingClosetsSteel,
      num? clothingOrOtherClosetsWood,
      num? electricStoves,
      num? electricStovesForBigKitchens,
      num? coldRoomCabinets,
      num? refrigerators,
      num? saunaStoves}) = _FixedFurniture;

  const FixedFurniture._();

  num? get ceramicMaterialVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull([
        toiletSeats,
        FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerPcs
      ]),
      Utils.multiplyOrNull([
        porcelainSinks,
        FurnitureDressingKitchenToiletSpaceWeights.toiletSinkPorcelainKgPerPcs
      ]),
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            toiletSeats,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSeatPorcelainKgPerPcs
          ]),
          Utils.multiplyOrZero([
            porcelainSinks,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSinkPorcelainKgPerPcs
          ]),
        ])! /
        FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerCbm;
  }

  num? get ceramicMaterialTons {
    final allNulls = !Utils.anyNonNull([toiletSeats, porcelainSinks]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            toiletSeats,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSeatPorcelainKgPerPcs
          ]),
          Utils.multiplyOrZero([
            porcelainSinks,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSinkPorcelainKgPerPcs
          ]),
        ])! /
        1000;
  }

  num? get stainlessSteelMaterialTons {
    if (steelTables == null) {
      return null;
    }
    return steelTables! *
        FurnitureDressingKitchenToiletSpaceWeights
            .steelSinksAndTablesRustProofKgPerPcs /
        1000;
  }

  num? get steelMaterialTons {
    if (dressingClosetsSteel == null) {
      return null;
    }
    return dressingClosetsSteel! *
        FurnitureDressingKitchenToiletSpaceWeights
            .metallicDressingClosets500x1600KgPerLinearMeter /
        1000;
  }

  num? get chipboardMaterialVolume {
    final allNulls = !Utils.anyNonNull([
      kitchenClosetsWoodOrChipboard,
      clothingOrOtherClosetsWood,
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          kitchenClosetsWoodOrChipboard,
          clothingOrOtherClosetsWood,
        ])! *
        FurnitureDressingKitchenToiletSpaceWeights
            .woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter /
        FurnitureDressingKitchenToiletSpaceWeights
            .woodBasedClosetsAndOtherFurnitureWidth06MKgPerCbm;
  }

  num? get chipboardMaterialTons {
    final allNulls = !Utils.anyNonNull([
      kitchenClosetsWoodOrChipboard,
      clothingOrOtherClosetsWood,
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          kitchenClosetsWoodOrChipboard,
          clothingOrOtherClosetsWood,
        ])! *
        FurnitureDressingKitchenToiletSpaceWeights
            .woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter /
        1000;
  }

  num? get electricScrapMaterialTons {
    final allNulls = !Utils.anyNonNull([
      electricStoves,
      electricStovesForBigKitchens,
      coldRoomCabinets,
      refrigerators,
      saunaStoves,
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            electricStoves,
            FurnitureDressingKitchenToiletSpaceWeights
                .electricStovesForApartmentsKgPerPcs
          ]),
          Utils.multiplyOrZero([
            electricStovesForBigKitchens,
            FurnitureDressingKitchenToiletSpaceWeights
                .foodServiceElecticStovesKgPerPcs
          ]),
          Utils.multiplyOrZero([
            coldRoomCabinets,
            FurnitureDressingKitchenToiletSpaceWeights.coldRoomCabinetsKgPerPcs
          ]),
          Utils.multiplyOrZero([
            refrigerators,
            FurnitureDressingKitchenToiletSpaceWeights.fridgesKgPerPcs
          ]),
          Utils.multiplyOrZero([
            saunaStoves,
            FurnitureDressingKitchenToiletSpaceWeights.saunaStovesKgPerPcs
          ]),
        ])! /
        1000;
  }
}
