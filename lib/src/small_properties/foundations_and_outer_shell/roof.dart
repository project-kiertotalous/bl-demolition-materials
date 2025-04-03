import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/data_types/roof_type_small_properties.dart';
import 'package:bl_demolition_materials/src/data_types/water_roof_type.dart';
import '../../utils/utils.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';

part 'roof.freezed.dart';

/// This file contains also the roof part from the Laskenta-tab in the Excel sheet.
/// All the calculations are done on the Laskenta tab.
/// There are also extra calculations on the Laskenta-tab which are not used in
/// Perustukset ja ulkovaippa-tab. These are marked.

/// Perustukset ja ulkovaippa, katto

@freezed
class Roof with _$Roof {
  Roof._();

  factory Roof({
    @Default(false) bool containsRecyclableWood,
    @Default(false) bool coveringMaterialContainsAsbestos,
    num? slopeLengthInMeters,
    num? slopeWidthInMeters,
    RoofType? roofType,
    WaterRoofType? waterRoofType,
  }) = _Roof;

  /// Kattopinta-ala (m2)
  num? get roofArea {
    switch (roofType) {
      case RoofType.gableRoof:
        return Utils.multiplyOrNull(
            [slopeLengthInMeters, slopeWidthInMeters, 2]);
      case RoofType.flatRoof:
      case RoofType.pentRoof:
        return Utils.multiplyOrNull([slopeLengthInMeters, slopeWidthInMeters]);
      default:
        return 0;
    }
  }

  /// Puisen ristikkorakenteen paino (tonnia)
  num? get woodenRoofLatticeWeightTons {
    if (roofType == RoofType.gableRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.gableRoofWithLattice800mmKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    } else if (roofType == RoofType.flatRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.flatRoofWithLattice800mmKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    } else if (roofType == RoofType.pentRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.cofferedCeilingWithLattice800mmKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    }
    return 0;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, puhdas käyttökelpoinen puu
  num? get cleanWoodTons {
    if (containsRecyclableWood == true) {
      return woodenRoofLatticeWeightTons;
    }
    return 0;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, polttokelpoinen puujäte
  num? get burnableWoodTons {
    if (containsRecyclableWood == false) {
      return woodenRoofLatticeWeightTons;
    }
    return 0;
  }

  /// Aluslaudoituksen paino (tonnia)
  bool get underBoardingWeightTonsSameAsRoofArea {
    return underBoardingWeightTons == roofArea;
  }

  /// Vesikatteen paino (kg/m2)
  num? get waterRoofWeightKgPerSqm {
    if (waterRoofType == WaterRoofType.roofingFelt) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofingFeltKgPerSqm
      ]);
      return multiply;
    } else if (waterRoofType == WaterRoofType.metalRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofSheet06mmKgPerSqm
      ]);
      return multiply;
    } else if (waterRoofType == WaterRoofType.mineriteRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
      ]);
      return multiply;
    } else if (waterRoofType == WaterRoofType.tiledRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofBrickKgPerSqm
      ]);
      return multiply;
    }
    return 0;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, teräs
  num? get waterRoofSteelTons {
    if (waterRoofType == WaterRoofType.metalRoof) {
      return waterRoofWeightKgPerSqm! / 1000;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, tiili
  num? get waterRoofTileTons {
    if (waterRoofType == WaterRoofType.tiledRoof) {
      return waterRoofWeightKgPerSqm! / 1000;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, huopa
  num? get waterRoofFeltTons {
    if (waterRoofType == WaterRoofType.roofingFelt &&
        coveringMaterialContainsAsbestos == false) {
      return waterRoofWeightKgPerSqm! / 1000;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, mineriitti- tai huopakate, sisältää asbestia (huopa)
  num? get waterRoofFeltAsbestosTons {
    if (waterRoofType == WaterRoofType.roofingFelt &&
        coveringMaterialContainsAsbestos == true) {
      return waterRoofWeightKgPerSqm! / 1000;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, mineriitti- tai huopakate, sisältää asbestia (mineriitti)
  num? get waterRoofMineriteAsbestosTons {
    if (waterRoofType == WaterRoofType.mineriteRoof &&
        coveringMaterialContainsAsbestos == true) {
      return waterRoofWeightKgPerSqm! / 1000;
    }
    return null;
  }

  /// Aluskate (tonnia)
  num? get underLaymentTons {
    num? multiply = Utils.multiplyOrNull([
      roofArea,
      BuildingBoardsAndInsulationMaterialWeights.underlaymentKgPerSqm
    ]);
    if (multiply != null) {
      return multiply;
    }
    return multiply! / 1000;
  }

  /// Laskenta, aluslaudoituksen paino (tonnia)
  num? get underBoardingWeightTons {
    if (roofType == RoofType.gableRoof) {
      return Utils.multiplyOrNull([
        (roofArea ?? 0 / 1000),
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
    } else if (roofType == RoofType.flatRoof) {
      return Utils.multiplyOrNull([
        woodenRoofLatticeWeightTons,
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
    } else if (roofType == RoofType.pentRoof) {
      return Utils.multiplyOrNull([
        woodenRoofLatticeWeightTons,
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
    }
    return 0;
  }

  /// Laskenta, kierrätettävä puu
  num? get recyclableWood {
    if (containsRecyclableWood == true) {
      if (roofType == RoofType.flatRoof || roofType == RoofType.pentRoof) {
        return woodenRoofLatticeWeightTons;
      }
      return 0;
    }
    return 0;
  }

  /// Laskenta, puhdas aluskate-energiajäte
  num? get recyclableUnderLaymentTons {
    if (coveringMaterialContainsAsbestos == false) {
      if (waterRoofType == WaterRoofType.roofingFelt ||
          waterRoofType == WaterRoofType.mineriteRoof ||
          waterRoofType == WaterRoofType.tiledRoof) {
        return underLaymentTons;
      }
      return 0;
    }
    return 0;
  }
}
