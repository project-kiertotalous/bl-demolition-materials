import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/data_types/wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/insulation_material_thickness.dart';
import 'package:bl_demolition_materials/src/data_types/outer_wall_surface_material.dart';
import 'package:bl_demolition_materials/src/small_properties/counting/exterior_and_load_bearing_walls_counter.dart';

part 'foundations.freezed.dart';

/// Poistettavat maa-ainekset, poistettava alue ja määrä
@freezed
class SoilToBeRemoved with _$SoilToBeRemoved {
  SoilToBeRemoved._();

  const factory SoilToBeRemoved({
    num? areOfTheRemovableSoil,
    num? depthInMeters,
    num? asphaltAreaInSquareMeters,
  }) = _SoilToBeRemoved;

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

  const factory Foundation({
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

  bool get containsAsbestos => false;

  bool get containsPcbPaints => false;
}

/// Ulko- ja kantavien väliseinien materiaalit
@freezed
class Walls with _$Walls {
  Walls._();

  const factory Walls({
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

  WoodMaterialType? get woodMaterialType => woodMaterialType;

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
