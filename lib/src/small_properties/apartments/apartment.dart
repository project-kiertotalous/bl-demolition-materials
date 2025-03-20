import 'package:bl_demolition_materials/src/data_types/bathroom_floor_material.dart';
import 'package:bl_demolition_materials/src/data_types/bathroom_wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/floor_material.dart';
import 'package:bl_demolition_materials/src/data_types/kitchen_wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/surface_material.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/small_properties/counting/apartmentCounter.dart';
import 'package:bl_demolition_materials/src/small_properties/apartments/apartment_size.dart';

part 'apartment.freezed.dart';

// Huoneistot
@freezed
class Apartment with _$Apartment {
  const Apartment._();

  const factory Apartment(
      {num? pcsPerHouse,
      num? floorAreaPerApartment,
      num? innerWallsPerApartmentLinearMeters,
      num? wallHeight,
      SurfaceMaterial? surfaceMaterial,
      FloorMaterial? floorMaterial,
      KitchenWallMaterial? kitchenWallMaterial,
      BathroomWallMaterial? bathroomWallMaterial,
      BathroomFloorMaterial? bathroomFloorMaterial,
      num? kitchenWallMaterialAreaPerApartment,
      num? kitchenClosetsinLinearMeter,
      @Default(false) bool areKitchenClosetsRecyclable,
      num? dressingClosetsinLinearMeter,
      @Default(false) bool areDressingClosetsRecyclable,
      num? bathroomWallAreaPerApartment,
      num? bathroomFloorAreaPerApartment,
      num? saunaPanelingAreaPerApartment,
      num? apartmentSpecificKitchenToiletOrSaunaFurniture,
      @Default(false) areFurnituresRecyclable,
      @Default(false) toiletSeat,
      @Default(false) ceramicSink,
      @Default(false) refridgerator,
      @Default(false) electricStove,
      @Default(false) steelTable,
      @Default(false) waterHeater,
      @Default(false) saunaStove}) = _Apartment;

  num? get wallAreaPerApartment =>
      Utils.multiplyOrNull([innerWallsPerApartmentLinearMeters, wallHeight]);

  num? get trunkWoodPerApartmentTons {
    if (wallAreaPerApartment == null && floorAreaPerApartment == null) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrNull([
            wallAreaPerApartment ?? 0,
            WoodMaterialInfo.woodWeightPerSquareMeter(
                WoodMaterialType.trunkWood50x100)
          ]),
          Utils.multiplyOrNull([
            floorAreaPerApartment ?? 0,
            WoodMaterialInfo.woodWeightPerSquareMeter(
                WoodMaterialType.trunkWood50x150)
          ])
        ])! /
        1000;
  }

  num? get surfaceMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull([
      ApartmentSize().totalWallArea,
      ApartmentCounter().totalSurfaceMaterial
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get floorMaterialPerApartmentTons =>
      0; // TODO laskenta tab needs to be implemented
}
