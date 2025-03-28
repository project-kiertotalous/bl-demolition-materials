import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:bl_demolition_materials/src/data_types/bathroom_floor_material.dart';
import 'package:bl_demolition_materials/src/data_types/bathroom_wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/floor_material.dart';
import 'package:bl_demolition_materials/src/data_types/kitchen_wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/surface_material.dart';
import 'package:bl_demolition_materials/src/small_properties/apartments/apartment.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
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

  num? get totalRoomCount => Utils.sumOrNull([
        oneRoom?.pcsPerHouse,
        twoRooms?.pcsPerHouse,
        threeRooms?.pcsPerHouse,
        fourRooms?.pcsPerHouse,
      ]);

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

  num? get totalKitchenClosetLength => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.kitchenClosetsInLinearMeter, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.kitchenClosetsInLinearMeter, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [threeRooms?.kitchenClosetsInLinearMeter, threeRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [fourRooms?.kitchenClosetsInLinearMeter, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalDressingClosetLength => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.dressingClosetsInLinearMeter, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.dressingClosetsInLinearMeter, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.dressingClosetsInLinearMeter,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.dressingClosetsInLinearMeter, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalkitchenClosetTons =>
      KitchenClosets(apartment: oneRoom, apartmentSize: this)
          .overallKitchenClosetTons;

  num? get totaldressingClosetTons =>
      DressingClosets(apartment: oneRoom, apartmentSize: this)
          .overallDressingClosetTons;

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

  num? get totalBathroomWallTons => KitchenBathroomAndToiletWallsAndFloors(
        apartment: oneRoom, // or any other Apartment? type
        apartmentSize: this,
      ).overallBathroomToiletWallMaterialTons;

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

  num? get totalBathroomFloorTons => KitchenBathroomAndToiletWallsAndFloors(
        apartment: oneRoom, // or any other Apartment? type
        apartmentSize: this,
      ).overallBathroomToiletFloorMaterialTons;

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

  num? get totalSaunaPanelingTons => SaunaWallPanels(
          apartment: oneRoom, // Or any other apartment type
          apartmentSize: this)
      .saunaPanelingWoodenPanelTons;

  num? get totalKitchenToiletOrSaunaFurnitureTons =>
      WaterAccumulators(apartment: oneRoom, apartmentSize: this)
          .overallFurnitureTons;
}

/// The rest of the code is from Laskenta-tab in the Excel sheet.
/// Laskenta, huoneistot
/// Sisäseinät
@freezed
class ApartmentWallMaterials with _$ApartmentWallMaterials {
  const ApartmentWallMaterials._();

  const factory ApartmentWallMaterials({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _ApartmentWallMaterials;

  num? get overallWallArea => apartmentSize?.totalWallArea;

  num? get plasterBoardSheetKgPerSqm {
    if (apartment?.surfaceMaterial == SurfaceMaterial.plasterBoard) {
      return BuildingBoardsAndInsulationMaterialWeights
          .plasterBoard15mmKgPerSqm;
    }
    return 0;
  }

  num? get chipboardKgPerSqm {
    if (apartment?.surfaceMaterial == SurfaceMaterial.chipboard) {
      return BuildingBoardsAndInsulationMaterialWeights.chipBoard11mmKgPerSqm;
    }
    return 0;
  }

  num? get woodenPanelKgPerSqm {
    if (apartment?.surfaceMaterial == SurfaceMaterial.woodenPanel) {
      return WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood50x100);
    }
    return 0;
  }

  num? get totalSurfaceMaterial => Utils.sumOrNull(
      [plasterBoardSheetKgPerSqm, chipboardKgPerSqm, woodenPanelKgPerSqm]);

  num? get innerWallsWoodTrunksTons => apartmentSize?.totalTrunkWoodTons;
}

/// Huoneistojen sisälattiat, materiaali
@freezed
class ApartmentFloorMaterials with _$ApartmentFloorMaterials {
  const ApartmentFloorMaterials._();

  const factory ApartmentFloorMaterials({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _ApartmentFloorMaterials;

  num? get overallFloorArea => apartmentSize?.totalFloorArea;

  num? get parquetKgPerSqm {
    if (apartment?.floorMaterial == FloorMaterial.parquet) {
      return FloorStructuresAndMaterialsWeights.parquetKgPerSqm;
    }
    return 0;
  }

  num? get plasticCarpetKgPerSqm {
    if (apartment?.floorMaterial == FloorMaterial.plasticCarpet) {
      return FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm;
    }
    return 0;
  }

  num? get woodPanelKgPerSqm {
    if (apartment?.floorMaterial == FloorMaterial.woodPanel) {
      return WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x100);
    }
    return 0;
  }

  num? get totalFloorMaterial => Utils.sumOrNull(
      [parquetKgPerSqm, plasticCarpetKgPerSqm, woodPanelKgPerSqm]);
}

/// Keittiö, pesutila ja WC seinät ja lattiat
@freezed
class KitchenBathroomAndToiletWallsAndFloors
    with _$KitchenBathroomAndToiletWallsAndFloors {
  const KitchenBathroomAndToiletWallsAndFloors._();

  const factory KitchenBathroomAndToiletWallsAndFloors({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _KitchenBathroomAndToiletWallsAndFloors;

  num? get kitchenArea => apartmentSize?.totalkitchenWallArea;

  num? get bathroomToiletWallArea => apartmentSize?.totalBathroomWallArea;

  num? get bathroomToiletFloorArea => apartmentSize?.totalBathroomFloorArea;

  num? get kitchenCeramicTileKg {
    if (apartment?.kitchenWallMaterial == KitchenWallMaterial.ceramicTile) {
      return FloorStructuresAndMaterialsWeights.ceramicTilesKgPerSqm;
    }
    return 0;
  }

  num? get bathroomToiletWallCeramicTileKg {
    if (apartment?.bathroomWallMaterial == BathroomWallMaterial.ceramicTile) {
      return FloorStructuresAndMaterialsWeights.ceramicTilesKgPerSqm;
    }
    return 0;
  }

  num? get bathroomToiletFloorCeramicTileKg {
    if (apartment?.bathroomFloorMaterial == BathroomFloorMaterial.ceramicTile) {
      return FloorStructuresAndMaterialsWeights.ceramicTilesKgPerSqm;
    }
    return 0;
  }

  num? get kitchenPlasticCarpet {
    if (apartment?.kitchenWallMaterial == KitchenWallMaterial.plasticCarpet) {
      return FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm;
    }
    return 0;
  }

  num? get bathroomToiletWallPlasticCarpet =>
      apartment?.bathroomWallMaterial == BathroomWallMaterial.plasticCarpet
          ? FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm
          : 0;

  num? get bathroomToiletFloorPlasticCarpet =>
      apartment?.bathroomFloorMaterial == BathroomFloorMaterial.plasticCarpet
          ? FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm
          : 0;

  num? get overallKitchenWallMaterial =>
      Utils.sumOrNull([kitchenCeramicTileKg, kitchenPlasticCarpet]);

  num? get overallBathroomToiletWallMaterial => Utils.sumOrNull(
      [bathroomToiletWallCeramicTileKg, bathroomToiletWallPlasticCarpet]);

  num? get overallBathroomToiletFloorMaterial => Utils.sumOrNull(
      [bathroomToiletFloorCeramicTileKg, bathroomToiletFloorPlasticCarpet]);

  num? get overallKitchenWallMaterialTons {
    num? multiply =
        Utils.multiplyOrNull([kitchenArea, overallKitchenWallMaterial]);
    return multiply! / 1000;
  }

  num? get overallBathroomToiletWallMaterialTons {
    num? multiply = Utils.multiplyOrNull(
        [bathroomToiletWallArea, overallBathroomToiletWallMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get overallBathroomToiletFloorMaterialTons {
    num? multiply = Utils.multiplyOrNull(
        [bathroomToiletFloorArea, overallBathroomToiletFloorMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Saunan seinäpaneelit
@freezed
class SaunaWallPanels with _$SaunaWallPanels {
  const SaunaWallPanels._();

  const factory SaunaWallPanels({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _SaunaWallPanels;

  num? get saunaPanelingArea => apartmentSize?.totalSaunaPanelingArea;

  num? get saunaPanelingWoodenPanelTons {
    num? multiply = Utils.multiplyOrNull([
      saunaPanelingArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Kalusteet (tonnia)
/// Keittiön kaapit
@freezed
class KitchenClosets with _$KitchenClosets {
  const KitchenClosets._();

  const factory KitchenClosets({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _KitchenClosets;

  /// Kaapiston pituus yhteensä
  num? get overAllKitchenClosetLength =>
      apartmentSize?.totalKitchenClosetLength;

  num? get overallKitchenClosetTons {
    num? multiply = Utils.multiplyOrNull([
      FurnitureDressingKitchenToiletSpaceWeights
          .woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs,
      overAllKitchenClosetLength
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get recyclableKitchenClosets {
    if (apartment?.areKitchenClosetsRecyclable == true) {
      return overallKitchenClosetTons;
    }
    return 0;
  }

  num? get quantityEstimateKitchenClosetsPcs {
    if (overAllKitchenClosetLength == null) {
      return null;
    }
    return overAllKitchenClosetLength! / 0.6;
  }
}

/// Vaatekomerot
@freezed
class DressingClosets with _$DressingClosets {
  const DressingClosets._();

  const factory DressingClosets({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _DressingClosets;

  /// Kaapiston pituus yhteensä
  num? get overAllDressingClosetLength =>
      apartmentSize?.totalDressingClosetLength;

  num? get overallDressingClosetTons {
    num? multiply = Utils.multiplyOrNull([
      FurnitureDressingKitchenToiletSpaceWeights
          .woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs,
      overAllDressingClosetLength
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get recyclableDressingClosets {
    if (apartment?.areDressingClosetsRecyclable == true) {
      return overallDressingClosetTons;
    }
    return 0;
  }

  num? get quantityEstimateDressingClosetsPcs {
    if (overAllDressingClosetLength == null) {
      return null;
    }
    return overAllDressingClosetLength! / 0.6;
  }
}

/// WC-istuin, posliini
@freezed
class PorcelainSeats with _$PorcelainSeats {
  const PorcelainSeats._();

  const factory PorcelainSeats({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _PorcelainSeats;

  num? get porcelainSeatPcs {
    if (apartment?.toiletSeat == true) {
      return apartmentSize?.totalRoomCount;
    }
    return 0;
  }

  num? get recyclablePorcelainSeatPcs {
    if (apartment?.isFurnitureRecyclable == true) {
      return porcelainSeatPcs;
    }
    return 0;
  }

  num? get porcelainSeatTons {
    num? multiply = Utils.multiplyOrNull([
      porcelainSeatPcs,
      FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get porcelainSeatScrapTons {
    if (porcelainSeatTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (porcelainSeatTons! - (recyclablePorcelainSeatPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Pesuallas, posliini
@freezed
class WashingSinks with _$WashingSinks {
  const WashingSinks._();

  const factory WashingSinks({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _WashingSinks;

  num? get washingSinkPcs {
    if (apartment?.ceramicSink == true) {
      return apartmentSize?.totalRoomCount;
    }
    return 0;
  }

  num? get recyclableWashingSinkPcs {
    if (apartment?.isFurnitureRecyclable == true) {
      return washingSinkPcs;
    }
    return 0;
  }

  num? get washingSinkTons {
    num? multiply = Utils.multiplyOrNull([
      washingSinkPcs,
      FurnitureDressingKitchenToiletSpaceWeights.washingSinkPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get washingSinkScrapTons {
    if (washingSinkTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (washingSinkTons! - (recyclableWashingSinkPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.washingSinkPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Teräsaltaat ja pöydät
@freezed
class SteelTableAndSinks with _$SteelTableAndSinks {
  const SteelTableAndSinks._();

  const factory SteelTableAndSinks({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _SteelTableAndSinks;

  num? get steelTablePcs {
    if (apartment?.steelTable == true) {
      return apartmentSize?.totalRoomCount;
    }
    return 0;
  }

  num? get recyclableSteelTablePcs {
    if (apartment?.isFurnitureRecyclable == true) {
      return steelTablePcs;
    }
    return 0;
  }

  num? get steelTableTons {
    num? multiply = Utils.multiplyOrNull([
      steelTablePcs,
      FurnitureDressingKitchenToiletSpaceWeights
          .steelSinksAndTablesRustProofKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get steelTableScrapTons {
    if (steelTableTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (steelTableTons! - (recyclableSteelTablePcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights
          .steelSinksAndTablesRustProofKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Saunankiukaat
@freezed
class SaunaStoves with _$SaunaStoves {
  const SaunaStoves._();

  const factory SaunaStoves({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _SaunaStoves;

  num? get saunaStovePcs {
    if (apartment?.saunaStove == true) {
      return apartmentSize?.totalRoomCount;
    }
    return 0;
  }

  num? get recyclableSaunaStovePcs {
    if (apartment?.isFurnitureRecyclable == true) {
      return saunaStovePcs;
    }
    return 0;
  }

  num? get saunaStoveTons {
    num? multiply = Utils.multiplyOrNull([
      saunaStovePcs,
      FurnitureDressingKitchenToiletSpaceWeights.saunaStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get saunaStoveScrapTons {
    if (saunaStoveTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (saunaStoveTons! - (recyclableSaunaStovePcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.saunaStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Sähköliedet
@freezed
class ElectricStoves with _$ElectricStoves {
  const ElectricStoves._();

  const factory ElectricStoves({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _ElectricStoves;

  num? get electricStovePcs {
    if (apartment?.electricStove == true) {
      return apartmentSize?.totalRoomCount;
    }
    return 0;
  }

  num? get recyclableElectricStovePcs {
    if (apartment?.isFurnitureRecyclable == true) {
      return electricStovePcs;
    }
    return 0;
  }

  num? get electricStoveTons {
    num? multiply = Utils.multiplyOrNull([
      electricStovePcs,
      FurnitureDressingKitchenToiletSpaceWeights.electricStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get electricStoveScrapTons {
    if (electricStoveTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (electricStoveTons! - (recyclableElectricStovePcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.electricStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Jääkaapit
@freezed
class Refrigerators with _$Refrigerators {
  const Refrigerators._();

  const factory Refrigerators({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _Refrigerators;

  num? get refrigeratorPcs {
    if (apartment?.refrigerator == true) {
      return apartmentSize?.totalRoomCount;
    }
    return 0;
  }

  num? get recyclableRefrigeratorPcs {
    if (apartment?.isFurnitureRecyclable == true) {
      return refrigeratorPcs;
    }
    return 0;
  }

  num? get refrigeratorTons {
    num? multiply = Utils.multiplyOrNull([
      refrigeratorPcs,
      FurnitureDressingKitchenToiletSpaceWeights.refrigeratorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get refrigeratorScrapTons {
    if (refrigeratorTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (refrigeratorTons! - (recyclableRefrigeratorPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.refrigeratorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Vesivaraajat
@freezed
class WaterAccumulators with _$WaterAccumulators {
  const WaterAccumulators._();

  const factory WaterAccumulators({
    required Apartment? apartment,
    required ApartmentSize? apartmentSize,
  }) = _WaterAccumulators;

  num? get waterAccumulatorPcs {
    if (apartment?.waterHeater == true) {
      return apartmentSize?.totalRoomCount;
    }
    return 0;
  }

  num? get recyclableWaterAccumulatorPcs {
    if (apartment?.isFurnitureRecyclable == true) {
      return waterAccumulatorPcs;
    }
    return 0;
  }

  num? get waterAccumulatorTons {
    num? multiply = Utils.multiplyOrNull([
      waterAccumulatorPcs,
      FurnitureDressingKitchenToiletSpaceWeights.waterAccumulatorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get waterAccumulatorScrapTons {
    if (waterAccumulatorTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (waterAccumulatorTons! - (recyclableWaterAccumulatorPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.waterAccumulatorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get overallFurnitureTons {
    return Utils.sumOrNull([
      PorcelainSeats(apartment: apartment, apartmentSize: apartmentSize)
          .porcelainSeatTons,
      WashingSinks(apartment: apartment, apartmentSize: apartmentSize)
          .washingSinkTons,
      SteelTableAndSinks(apartment: apartment, apartmentSize: apartmentSize)
          .steelTableTons,
      SaunaStoves(apartment: apartment, apartmentSize: apartmentSize)
          .saunaStoveTons,
      ElectricStoves(apartment: apartment, apartmentSize: apartmentSize)
          .electricStoveTons,
      Refrigerators(apartment: apartment, apartmentSize: apartmentSize)
          .refrigeratorTons,
      WaterAccumulators(apartment: apartment, apartmentSize: apartmentSize)
          .waterAccumulatorTons,
    ]);
  }
}
