import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data_types/roof_type_small_properties.dart';
import '../../data_types/water_roof_type.dart';
import '../../small_properties/yard_buildings_and_structures/carport_or_garage.dart';
import '../../small_properties/material_weight.dart';
import '../../utils/utils.dart';

part 'roof.freezed.dart';

/// Piharakennukset ja rakenteet
/// Katto

@freezed
abstract class Roof with _$Roof {
  const Roof._();

  const factory Roof(
      {RoofTypeSmallProperties? roofType,
      WaterRoofType? waterRoofType,
      num? lapelLengthInMeters,
      num? lapelWidthInMeters}) = _Roof;

  /// Kattopinta-ala (m2)
  num? get roofArea {
    if (roofType == RoofTypeSmallProperties.gableRoof) {
      return Utils.multiplyOrNull([lapelLengthInMeters, lapelWidthInMeters, 2]);
    } else if (roofType == RoofTypeSmallProperties.flatRoof) {
      return Utils.multiplyOrNull([lapelLengthInMeters, lapelWidthInMeters]);
    } else if (roofType == RoofTypeSmallProperties.pentRoof) {
      return Utils.multiplyOrNull([lapelLengthInMeters, lapelWidthInMeters]);
    }
    return null;
  }

  /// Puisen ristikkorakenteen paino (tonnia)
  num? get woodenRoofLatticeWeightTons {
    if (roofType == RoofTypeSmallProperties.gableRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.gableRoofWithLattice800mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (roofType == RoofTypeSmallProperties.flatRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.flatRoofWithLattice800mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (roofType == RoofTypeSmallProperties.pentRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        WoodenRoofStructuresWeights.cofferedCeilingWithLattice800mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Aluslaudoituksen paino (tonnia)
  num? get underBoardingWeightTons {
    num? multiply = Utils.multiplyOrNull([
      roofArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Vesikattteen paino (tonnia)
  num? get waterRoofWeightTons {
    if (waterRoofType == WaterRoofType.roofingFelt) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofingFeltKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (waterRoofType == WaterRoofType.metalRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofSheet06mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (waterRoofType == WaterRoofType.mineriteRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (waterRoofType == WaterRoofType.tiledRoof) {
      num? multiply = Utils.multiplyOrNull([
        roofArea,
        BuildingBoardsAndInsulationMaterialWeights.roofBrickKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Aluskate (tonnia)
  num? get underlaymentWeightTons {
    num? multiply = Utils.multiplyOrNull([
      roofArea,
      BuildingBoardsAndInsulationMaterialWeights.underlaymentKgPerSqm
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Laskenta
  /// Katto

  /// Ristikkojako 800mm, tonnia
  num? get woodenRoofLattice800mmWeightTons => woodenRoofLatticeWeightTons;

  /// Huopa, tonnia
  num? get roofingFeltWeightTons {
    if (waterRoofType == WaterRoofType.roofingFelt) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Huopa, asbestia
  num? get roofingFeltAsbestosWeightTons {
    if (waterRoofType == WaterRoofType.roofingFelt &&
        CarportOrGarage().coveringMaterialContainsAsbestos == true) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Teräs, tonnia
  num? get steelSheetWeightTons {
    if (waterRoofType == WaterRoofType.metalRoof) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Mineriitti, tonnia
  num? get mineriteBoardWeightTons {
    if (waterRoofType == WaterRoofType.mineriteRoof) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Tiili, tonnia
  num? get roofBrickWeightTons {
    if (waterRoofType == WaterRoofType.tiledRoof) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Tiili, asbestia
  num? get roofBrickAsbestosWeightTons {
    if (waterRoofType == WaterRoofType.tiledRoof &&
        CarportOrGarage().coveringMaterialContainsAsbestos == true) {
      return waterRoofWeightTons;
    }
    return null;
  }
}
