import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/data_types/wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/insulation_material_thickness.dart';
import 'package:bl_demolition_materials/src/data_types/outer_wall_surface_material.dart';

part 'foundations.freezed.dart';

/// Poistettavat maa-ainekset, poistettava alue ja määrä
@freezed
class ExcavationAreaSmallProperties with _$ExcavationAreaSmallProperties {
  ExcavationAreaSmallProperties._();

  factory ExcavationAreaSmallProperties({
    num? areOfTheRemovableSoil,
    num? depthInMeters,
    num? asphaltAreaInSquareMeters,
  }) = _ExcavationAreaSmallProperties;

  /// Poistettava määrä (m3)
  num? get soilToBeRemovedVolume =>
      Utils.multiplyOrNull([areOfTheRemovableSoil, depthInMeters]);

  /// Poistettava maa (yhteensä, tonnia)
  num? get soilToBeRemovedTons {
    num? multiply = Utils.multiplyOrNull(
        [soilToBeRemovedVolume, FoundationWeights.removableSoilKgPerCbm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Poistettava puhdas maa (%)
  num? get removableCleanSoilInPercents => 1;

  /// Poistettavasta maasta saastunutta (%)
  num? get contaminatedSoil => 1 - removableCleanSoilInPercents!;

  // Asfaltti (tonnia)
  num? get asphaltTons {
    num? multiply = Utils.multiplyOrNull(
        [asphaltAreaInSquareMeters, FoundationWeights.asphaltKgPerSqm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Perustus
@freezed
class Foundation with _$Foundation {
  Foundation._();

  factory Foundation({
    @Default(false) bool containsAsbestos,
    @Default(false) bool containsPcbPaints,
    num? plinthLengthInLinearMeters,
    num? plinthThicknessInMeters,
    num? concreteSlabAreaInSquareMeters,
    num? plinthHeightInMeters,
    num? concreteSlabThicknessInMeters,
  }) = _Foundation;

  /// Betoni (m3)
  num? get concreteVolume => Utils.sumOrNull([
        Utils.multiplyOrNull([
          plinthLengthInLinearMeters,
          plinthThicknessInMeters,
          plinthHeightInMeters
        ]),
        Utils.multiplyOrNull(
            [concreteSlabAreaInSquareMeters, concreteSlabThicknessInMeters])
      ]);

  /// Betoni (tonnia)
  num? get concreteTons {
    num? multiply = Utils.multiplyOrNull(
        [concreteVolume, FoundationWeights.concreteKgPerCbm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Betoni teräs (tonnia)
  num? get reinforcedConcreteTons {
    num? multiply = Utils.multiplyOrNull(
        [concreteVolume, FoundationWeights.concreteOrSteelBlockKgPerCbm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Ulko- ja kantavien väliseinien materiaalit
@freezed
class Walls with _$Walls {
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
      WallCounter(walls: this).partitionWallsConcreteTons;

  /// Kiviseinät ja osittainen ulkovuoraus, tiili
  num? get brickWallsPartialExteriorCladdingTons =>
      WallCounter(walls: this).partitionWallsBricksTons;

  /// Runko (tonnia) runkopuu 50x100
  num? get trunkWood50x100Tons => WallCounter(walls: this).trunkWood50x100Tons;

  /// Runko (tonnia) runkopuu 50x150
  num? get trunkWood50x150Tons => WallCounter(walls: this).trunkWood50x150Tons;

  /// Runko (tonnia) runkopuu 50x200
  num? get trunkWood50x200Tons => WallCounter(walls: this).trunkWood50x200Tons;

  /// Runko (tonnia) runkopuu 100x100
  num? get trunkWood100x100Tons =>
      WallCounter(walls: this).trunkWood100x100Tons;

  /// Runko (tonnia) runkopuu 150x150
  num? get trunkWood150x150Tons =>
      WallCounter(walls: this).trunkWood150x150Tons;

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
  num? get outerWallBoardCurtainTons =>
      WallCounter(walls: this).boardCurtainBrickMineriteBoardTons;
}

/// The rest of the code is from Laskenta-tab in the Excel sheet.

/// Laskenta
/// Perustus

@freezed
class FoundationCounter with _$FoundationCounter {
  FoundationCounter._();

  factory FoundationCounter({
    required Foundation foundation,
  }) = _FoundationCounter;

  /// Betoniperustus (tonnia)
  num? get concreteFoundationTons => foundation.concreteTons;

  /// Betoni, puhdas (tonnia)
  num? get cleanConcreteTons {
    if (foundation.containsAsbestos || foundation.containsPcbPaints) {
      return 0;
    }
    return foundation.concreteTons;
  }

  /// No explanation for this value
  num? get nextToCleanConcreteTons {
    if (Utils.sumOrNull(
            [reinforcedConcreteAsbestos, reinforcedConcretePcbPaints]) ==
        0) {
      return 1;
    }
    return 0;
  }

  /// Betoni, teräs (tonnia)
  num? get reinforcedConcreteTons {
    num? multiply = Utils.multiplyOrNull([
      FoundationWeights.concreteOrSteelBlockKgPerCbm,
      foundation.reinforcedConcreteTons
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Asbestia
  num? get reinforcedConcreteAsbestos {
    if (foundation.containsAsbestos) {
      return concreteFoundationTons;
    }
    return 0;
  }

  /// PCB:tä
  num? get reinforcedConcretePcbPaints {
    if (foundation.containsPcbPaints) {
      return concreteFoundationTons;
    }
    return 0;
  }

  /// No explanation for this value
  num? get nextToReinforcedConcretePcbPaints {
    if (Utils.sumOrNull(
            [reinforcedConcreteAsbestos, reinforcedConcretePcbPaints]) ==
        Utils.multiplyOrNull([concreteFoundationTons, 2])) {
      return 0;
    }
    return 1;
  }
}

/// Laskenta
/// Ulko- ja kantavien väliseinien materiaalit

@freezed
class WallCounter with _$WallCounter {
  WallCounter._();

  factory WallCounter({
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
