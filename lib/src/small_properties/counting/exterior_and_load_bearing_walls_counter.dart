import 'package:bl_demolition_materials/src/small_properties/foundations_and_outer_shell/foundations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:bl_demolition_materials/src/data_types/wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/outer_wall_surface_material.dart';

part 'exterior_and_load_bearing_walls_counter.freezed.dart';

/// Laskenta
/// Ulko- ja kantavien väliseinien materiaalit

@freezed
class WallCounter with _$WallCounter {
  WallCounter._();

  const factory WallCounter({
    required Walls walls,
  }) = _WallCounter;

  /// Väliseinät (tonnia), tiili
  num? get partitionWallsBricksTons {
    if (walls.wallMaterial == WallMaterial.concrete) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      walls.stoneOrBrickWallsInLinearMeters,
      walls.heightInMeters,
      StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Kierrätyskelpoinen osuus väliseinistä (tonnia), tiili
  num? get recyclablePartitionWallsBricksTons {
    if (!walls.isAggregateRecyclable) {
      return 0;
    }
    return partitionWallsBricksTons;
  }

  /// Väliseinät (tonnia), betoni
  num? get partitionWallsConcreteTons {
    if (walls.wallMaterial == WallMaterial.brick) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      walls.stoneOrBrickWallsInLinearMeters,
      walls.heightInMeters,
      StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Kierrätyskelpoinen osuus väliseinistä (tonnia), betoni
  num? get recyclablePartitionWallsConcreteTons {
    if (!walls.isAggregateRecyclable) {
      return 0;
    }
    return partitionWallsConcreteTons;
  }

  num? get overallPartitionWallsTons {
    return Utils.sumOrNull([
      partitionWallsBricksTons,
      partitionWallsConcreteTons,
    ]);
  }

  /// Puurunko, ulkoseinät

  /// Runkopuu 50x100, tonnia
  num? get trunkWood50x100Tons {
    if (walls.woodMaterialType != WoodMaterialType.trunkWood50x100) {
      return 0;
    }
    if (!walls.isTrunkWoodRecyclable) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x100),
      walls.outerWallArea
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Runkopuu 50x150, tonnia
  num? get trunkWood50x150Tons {
    if (walls.woodMaterialType != WoodMaterialType.trunkWood50x150) {
      return 0;
    }
    if (!walls.isTrunkWoodRecyclable) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x150),
      walls.outerWallArea
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Runkopuu 50x200, tonnia
  num? get trunkWood50x200Tons {
    if (walls.woodMaterialType != WoodMaterialType.trunkWood50x200) {
      return 0;
    }
    if (!walls.isTrunkWoodRecyclable) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x200),
      walls.outerWallArea
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Runkopuu 100x100, tonnia
  num? get trunkWood100x100Tons {
    if (walls.woodMaterialType != WoodMaterialType.trunkWood100x100) {
      return 0;
    }
    if (!walls.isTrunkWoodRecyclable) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood100x100),
      walls.outerWallArea
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Runkopuu 150x150, tonnia
  num? get trunkWood150x150Tons {
    if (walls.woodMaterialType != WoodMaterialType.trunkWood150x150) {
      return 0;
    }
    if (!walls.isTrunkWoodRecyclable) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood150x150),
      walls.outerWallArea
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Tuulensuojalevy (tonnia)
  num? get windProtectionBoard => walls.windProtectionBoardTons;

  /// Eristevilla, paino
  /// In excel the same number is returned no matter the thickness of the wool, so made only one function
  num? get insulationWoolTons {
    num? multiply = Utils.multiplyOrNull([
      walls.outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Lautaverhousten paino (tonnia)
  num? get boardCladdingTons {
    if (walls.outerWallSurfaceMaterial !=
        OuterWallSurfaceMaterial.boardCurtain) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      walls.outerWallArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// tiili, tonnia
  num? get brickTons {
    if (walls.outerWallSurfaceMaterial != OuterWallSurfaceMaterial.brick) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      walls.outerWallArea,
      StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// mineriittilevy, tonnia
  num? get mineriteBoardTons {
    if (walls.outerWallSurfaceMaterial !=
        OuterWallSurfaceMaterial.mineriteBoard) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      walls.outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Lautaverhos, tiili + mineriittilevy, tonnia
  num? get boardCurtainBrickMineriteBoardTons {
    return Utils.sumOrNull([boardCladdingTons, brickTons, mineriteBoardTons]);
  }
}
