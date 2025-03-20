import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bl_demolition_materials/src/data_types/bathroom_floor_material.dart';
import 'package:bl_demolition_materials/src/data_types/bathroom_wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/floor_material.dart';
import 'package:bl_demolition_materials/src/data_types/kitchen_wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/surface_material.dart';
import 'package:bl_demolition_materials/src/small_properties/apartments/apartment.dart';
import 'package:bl_demolition_materials/src/small_properties/apartments/apartment_size.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';

part 'apartmentCounter.freezed.dart';

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

  num? get bathroomToiletWallPlasticCarpet {
    if (apartment?.bathroomWallMaterial == BathroomWallMaterial.plasticCarpet) {
      return FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm;
    }
    return 0;
  }

  num? get bathroomToiletFloorPlasticCarpet {
    if (apartment?.bathroomFloorMaterial ==
        BathroomFloorMaterial.plasticCarpet) {
      return FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm;
    }
    return 0;
  }

  num? get overallKitchenWallMaterial =>
      Utils.sumOrNull([kitchenCeramicTileKg, kitchenPlasticCarpet]);

  num? get overallBathroomToiletWallMaterial => Utils.sumOrNull(
      [bathroomToiletWallCeramicTileKg, bathroomToiletWallPlasticCarpet]);

  num? get overallBathroomToiletFloorMaterial => Utils.sumOrNull(
      [bathroomToiletFloorCeramicTileKg, bathroomToiletFloorPlasticCarpet]);

  num? get overallKitchenWallMaterialTons {
    num? multiply =
        Utils.multiplyOrNull([kitchenArea, overallKitchenWallMaterial]);
    if (multiply == 0) {
      return 0;
    }
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
