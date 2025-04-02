import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../shared/water_roof_type.dart';
import '../../utils/utils.dart';
import '../data_types/exports.dart';
import '../data_types/small_property_roof_type.dart';

part 'roof.freezed.dart';

/// This file contains also the roof part from the Laskenta-tab in the Excel sheet.
/// All the calculations are done on the Laskenta tab.
/// There are also extra calculations on the Laskenta-tab which are not used in
/// Perustukset ja ulkovaippa-tab. These are marked.

/// Perustukset ja ulkovaippa, katto

@freezed
abstract class Roof with _$Roof {
  Roof._();

  factory Roof({
    @Default(false) bool containsRecyclableWood,
    @Default(false) bool coveringMaterialContainsAsbestos,
    num? slopeLengthInMeters,
    num? slopeWidthInMeters,
    SmallPropertyRoofType? roofType,
    WaterRoofType? waterRoofType,
  }) = _Roof;

  /// Kattopinta-ala (m2)
  num? get roofArea {
    switch (roofType) {
      case SmallPropertyRoofType.gableRoof:
        return Utils.multiplyOrNull(
            [slopeLengthInMeters, slopeWidthInMeters, 2]);
      case SmallPropertyRoofType.flatRoof:
      case SmallPropertyRoofType.pentRoof:
        return Utils.multiplyOrNull([slopeLengthInMeters, slopeWidthInMeters]);
      default:
        return 0;
    }
  }

  /// Puisen ristikkorakenteen paino (tonnia)
  num? get woodenRoofLatticeWeightTons {
    if (roofType == SmallPropertyRoofType.gableRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.gableRoofWithLattice800mmKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    } else if (roofType == SmallPropertyRoofType.flatRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.flatRoofWithLattice800mmKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    } else if (roofType == SmallPropertyRoofType.pentRoof) {
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

  /// Aluslaudoituksen paino (tonnia)
  bool get underBoardingWeightTonsSameAsRoofArea {
    return underBoardingWeightTons == roofArea;
  }

  /// Vesikatteen paino (tonnia)
  num? get waterRoofWeightTons {
    if (waterRoofType == WaterRoofType.roofingFelt) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofingFeltKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    } else if (waterRoofType == WaterRoofType.metalRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofSheet06mmKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    } else if (waterRoofType == WaterRoofType.mineriteRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    } else if (waterRoofType == WaterRoofType.tiledRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofBrickKgPerSqm
      ]);
      if (multiply != null) {
        return multiply;
      }
      return multiply! / 1000;
    }
    return 0;
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
    if (roofType == SmallPropertyRoofType.gableRoof) {
      return Utils.multiplyOrNull([
        (roofArea ?? 0 / 1000),
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
    } else if (roofType == SmallPropertyRoofType.flatRoof) {
      return Utils.multiplyOrNull([
        woodenRoofLatticeWeightTons,
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
    } else if (roofType == SmallPropertyRoofType.pentRoof) {
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
      if (roofType == SmallPropertyRoofType.flatRoof ||
          roofType == SmallPropertyRoofType.pentRoof) {
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
