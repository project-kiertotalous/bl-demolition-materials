import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/data_types/wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/insulation_material_thickness.dart';
import 'package:bl_demolition_materials/src/data_types/outer_wall_surface_material.dart';

part 'walls.freezed.dart';

/// Ulko- ja kantavien väliseinien materiaalit
@freezed
abstract class Walls with _$Walls {
  Walls._();

  factory Walls({
    @Default(false) bool isTrunkWoodRecyclable,
    @Default(false) bool isInsulationWoolRecyclable,
    @Default(false) bool isAggregateRecyclable,
    num? lengthInMeters,
    num? widthInMeters,
    num? heightInMeters,
    num? stoneOrBrickWallsInLinearMeters,
    WoodMaterialType? woodMaterialType,
    WallMaterial? wallMaterial,
    InsulationMaterialThickness? insulationMaterialThickness,
    OuterWallSurfaceMaterial? outerWallSurfaceMaterial,
  }) = _Walls;

  /// Ulkoseinän pinta-ala (m2)
  num? get outerWallArea =>
      Utils.multiplyOrNull([lengthInMeters, widthInMeters, heightInMeters, 2]);

  /// Kiviseinät ja osittainen ulkovuoraus, betoni
  num? get concreteWallsPartialExteriorCladdingTons =>
      partitionWallsConcreteTons;

  /// Kiviseinät ja osittainen ulkovuoraus, tiili
  num? get brickWallsPartialExteriorCladdingTons => partitionWallsBricksTons;

  /// Runko (tonnia) runkopuu 50x100
  num? get wallTrunkWood50x100Tons => trunkWood50x100Tons;

  /// Runko (tonnia) runkopuu 50x150
  num? get wallTrunkWood50x150Tons => trunkWood50x150Tons;

  /// Runko (tonnia) runkopuu 50x200
  num? get wallTrunkWood50x200Tons => trunkWood50x200Tons;

  /// Runko (tonnia) runkopuu 100x100
  num? get wallTrunkWood100x100Tons => trunkWood100x100Tons;

  /// Runko (tonnia) runkopuu 150x150
  num? get wallTrunkWood150x150Tons => trunkWood150x150Tons;

  /// Also in Laskenta tab
  /// Tuulensuojalevy (tonnia)
  num? get windProtectionBoardTons {
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.windProtectionBoardKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Ulkoseinän pintamateriaali (tonnia)
  num? get outerWallBoardCurtainTons => boardCurtainBrickMineriteBoardTons;

  /// Laskenta
  /// Ulko- ja kantavien väliseinien materiaalit

  /// Väliseinät (tonnia), tiili
  num? get partitionWallsBricksTons {
    if (wallMaterial == WallMaterial.concrete) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      stoneOrBrickWallsInLinearMeters,
      heightInMeters,
      StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Kierrätyskelpoinen osuus väliseinistä (tonnia), tiili
  num? get recyclablePartitionWallsBricksTons {
    if (!isAggregateRecyclable) {
      return 0;
    }
    return partitionWallsBricksTons;
  }

  /// Väliseinät (tonnia), betoni
  num? get partitionWallsConcreteTons {
    if (wallMaterial == WallMaterial.brick) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      stoneOrBrickWallsInLinearMeters,
      heightInMeters,
      StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Kierrätyskelpoinen osuus väliseinistä (tonnia), betoni
  num? get recyclablePartitionWallsConcreteTons {
    if (!isAggregateRecyclable) {
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
    if (woodMaterialType != WoodMaterialType.trunkWood50x100) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x100),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 50x150, tonnia
  num? get trunkWood50x150Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood50x150) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x150),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 50x200, tonnia
  num? get trunkWood50x200Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood50x200) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x200),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 100x100, tonnia
  num? get trunkWood100x100Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood100x100) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood100x100),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 150x150, tonnia
  num? get trunkWood150x150Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood150x150) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood150x150),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Eristevilla, paino
  /// In excel the same number is returned no matter the thickness of the wool, so made only one function
  num? get insulationWoolTons {
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Lautaverhousten paino (tonnia)
  num? get boardCladdingTons {
    if (outerWallSurfaceMaterial != OuterWallSurfaceMaterial.boardCurtain) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// tiili, tonnia
  num? get brickTons {
    if (outerWallSurfaceMaterial != OuterWallSurfaceMaterial.brick) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// mineriittilevy, tonnia
  num? get mineriteBoardTons {
    if (outerWallSurfaceMaterial != OuterWallSurfaceMaterial.mineriteBoard) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Lautaverhous, tiili + mineriittilevy, tonnia
  num? get boardCurtainBrickMineriteBoardTons {
    return Utils.sumOrNull([boardCladdingTons, brickTons, mineriteBoardTons]);
  }
}
