import 'package:bl_demolition_materials/src/small_properties/counting/apartmentCounter.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'apartment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apartment_size.freezed.dart';

@freezed
class ApartmentSize with _$ApartmentSize {
  const ApartmentSize._();

  const factory ApartmentSize({
    Apartment? oneRoom,
    Apartment? twoRooms,
    Apartment? threeRooms,
    Apartment? fourRooms,
  }) = _ApartmentSize;

  num? get totalFloorArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.pcsPerHouse, oneRoom?.floorAreaPerApartment]),
        Utils.multiplyOrNull(
            [twoRooms?.pcsPerHouse, twoRooms?.floorAreaPerApartment]),
        Utils.multiplyOrNull(
            [threeRooms?.pcsPerHouse, threeRooms?.floorAreaPerApartment]),
        Utils.multiplyOrNull(
            [fourRooms?.pcsPerHouse, fourRooms?.floorAreaPerApartment]),
      ]);

  num? get totalWallArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.wallAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.wallAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [threeRooms?.wallAreaPerApartment, threeRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [fourRooms?.wallAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalTrunkWoodTons => Utils.sumOrNull([
        oneRoom?.trunkWoodPerApartmentTons,
        twoRooms?.trunkWoodPerApartmentTons,
        threeRooms?.trunkWoodPerApartmentTons,
        fourRooms?.trunkWoodPerApartmentTons,
      ]);

  num? get totalSurfaceMaterialTons {
    final apartmentWallMaterials = ApartmentWallMaterials(
      apartment: oneRoom, // or any other Apartment? type
      apartmentSize: this,
    );
    num? multiply = Utils.multiplyOrNull(
        [totalWallArea, apartmentWallMaterials.totalSurfaceMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get totalFloorMaterialTons {
    final apartmentFloorMaterials = ApartmentFloorMaterials(
      apartment: oneRoom, // or any other Apartment? type
      apartmentSize: this,
    );
    num? multiply = Utils.multiplyOrNull(
        [totalFloorArea, apartmentFloorMaterials.totalFloorMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get totalkitchenWallArea => Utils.sumOrNull([
        Utils.multiplyOrNull([
          oneRoom?.kitchenWallMaterialAreaPerApartment,
          oneRoom?.pcsPerHouse
        ]),
        Utils.multiplyOrNull([
          twoRooms?.kitchenWallMaterialAreaPerApartment,
          twoRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull([
          threeRooms?.kitchenWallMaterialAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull([
          fourRooms?.kitchenWallMaterialAreaPerApartment,
          fourRooms?.pcsPerHouse
        ]),
      ]);

  num? get totalkitchenWallTons => KitchenBathroomAndToiletWallsAndFloors(
        apartment: oneRoom, // or any other Apartment? type
        apartmentSize: this,
      ).overallKitchenWallMaterial;

  num? get totalkitchenClosetTons => 0; // TODO

  num? get totaldressingClosetTons => 0; // TODO

  num? get totalBathroomWallArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.bathroomWallAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.bathroomWallAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.bathroomWallAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.bathroomWallAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalBathroomWallTons => 0; // TODO

  num? get totalBathroomFloorArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.bathroomFloorAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.bathroomFloorAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.bathroomFloorAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.bathroomFloorAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalBathroomFloorTons => 0; // TODO

  num? get totalSaunaPanelingArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.saunaPanelingAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.saunaPanelingAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.saunaPanelingAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.saunaPanelingAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalSaunaPanelingTons => 0; // TODO

  num? get totalKitchenToiletOrSaunaFurnitureTons => 0; // TODO
}
