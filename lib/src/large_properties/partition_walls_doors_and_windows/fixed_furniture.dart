import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/large_properties/material_info.dart';

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

  num get ceramicMaterialVolume =>
      (toiletSeats! *
              FurnitureDressingKitchenToiletSpaceWeights
                  .toiletSeatPorcelainKgPerPcs +
          porcelainSinks! *
              FurnitureDressingKitchenToiletSpaceWeights
                  .toiletSinkPorcelainKgPerPcs) /
      FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerCbm;

  num get ceramicMaterialTons =>
      (toiletSeats! *
              FurnitureDressingKitchenToiletSpaceWeights
                  .toiletSeatPorcelainKgPerPcs +
          porcelainSinks! *
              FurnitureDressingKitchenToiletSpaceWeights
                  .toiletSinkPorcelainKgPerPcs) /
      1000;

  num get stainlessSteelMaterialTons =>
      steelTables! *
      FurnitureDressingKitchenToiletSpaceWeights
          .steelSinksAndTablesRustProofKgPerPcs /
      1000;

  num get steelMaterialTons =>
      dressingClosetsSteel! *
      FurnitureDressingKitchenToiletSpaceWeights
          .metallicDressingClosets500x1600KgPerLinearMeter /
      1000;

  num get chipboardMaterialVolume =>
      (kitchenClosetsWoodOrChipboard! + clothingOrOtherClosetsWood!) *
      FurnitureDressingKitchenToiletSpaceWeights
          .woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter /
      FurnitureDressingKitchenToiletSpaceWeights
          .woodBasedClosetsAndOtherFurnitureWidth06MKgPerCbm;

  num get chipboardMaterialTons =>
      (kitchenClosetsWoodOrChipboard! + clothingOrOtherClosetsWood!) *
      FurnitureDressingKitchenToiletSpaceWeights
          .woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter /
      1000;

  num get electricScrapMaterialTons =>
      (electricStoves! *
              FurnitureDressingKitchenToiletSpaceWeights
                  .electricStovesForApartmentsKgPerPcs +
          electricStovesForBigKitchens! *
              FurnitureDressingKitchenToiletSpaceWeights
                  .foodServiceElecticStovesKgPerPcs +
          coldRoomCabinets! *
              FurnitureDressingKitchenToiletSpaceWeights
                  .coldRoomCabinetsKgPerPcs +
          refrigerators! *
              FurnitureDressingKitchenToiletSpaceWeights.fridgesKgPerPcs +
          saunaStoves! *
              FurnitureDressingKitchenToiletSpaceWeights.saunaStovesKgPerPcs) /
      1000;
}
