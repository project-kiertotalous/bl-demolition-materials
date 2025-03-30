import 'package:freezed_annotation/freezed_annotation.dart';
import '../../small_properties/material_weight.dart';
import '../../data_types/foundation_type.dart';
import '../../data_types/garage_wall_material.dart';
import '../../data_types/insulation_material_thickness.dart';
import '../../utils/utils.dart';

part 'carport_or_garage.freezed.dart';

/// Piharakennukset ja rakenteet
/// Autokatos tai autotalli, erilliset ulkovarastot ja lämpökeskus
@freezed
abstract class CarportOrGarage with _$CarportOrGarage {
  const CarportOrGarage._();

  const factory CarportOrGarage(
      {num? buildingLengthInMeters,
      num? buildingWidthInMeters,
      FoundationType? foundationType,
      @Default(false) bool buildingFoundationAndWallsContainAsbestosOrPcbPaints,
      @Default(false) bool coveringMaterialContainsAsbestos,
      GarageWallMaterial? garageWallMaterial,
      InsulationMaterialThickness? insulationMaterialThickness,
      num? wallAverageHeight,
      num? buildingWallLengthTotal}) = _CarportOrGarage;

  /// Asfaltti (tonnia)
  num? get asphaltTons {
    if (foundationType == FoundationType.concreteSlab) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      Utils.sumOrNull([buildingLengthInMeters, buildingWidthInMeters]),
      2
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply * YardStructureWeights.concreteBarsKgPerPcs / 1000;
  }

  /// Betoni (tonnia)
  num? get concreteTons {
    if (foundationType == FoundationType.concreteSlab) {
      num? multiply = Utils.multiplyOrNull([
        buildingLengthInMeters,
        buildingWidthInMeters,
        FoundationWeights.concreteKgPerCbm
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    } else if (foundationType == FoundationType.concretePillars) {
      num? multiply = Utils.multiplyOrNull([
        buildingLengthInMeters,
        buildingWidthInMeters,
        YardStructureWeights.concreteBarsKgPerPcs
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    }
    return null;
  }

  /// Katoksen/tallin seinät
  /// Pinta-ala (m2)
  num? get wallArea =>
      Utils.multiplyOrNull([buildingWallLengthTotal, wallAverageHeight]);

  /// Seinämateriaali (tonnia)
  num? get wallMaterialTons {
    if (garageWallMaterial == GarageWallMaterial.board) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (garageWallMaterial == GarageWallMaterial.brick) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (garageWallMaterial == GarageWallMaterial.steelSheet) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights
            .steelBoardCladding06mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (garageWallMaterial == GarageWallMaterial.concrete) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Eriste (tonnia)
  num? get insulationThicknessTons {
    if (insulationMaterialThickness ==
        InsulationMaterialThickness.thickness100mm) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (insulationMaterialThickness ==
        InsulationMaterialThickness.thickness200mm) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm,
        2
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (insulationMaterialThickness ==
        InsulationMaterialThickness.thickness300mm) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm,
        3
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }
}
