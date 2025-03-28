import 'package:bl_demolition_materials/src/data_types/water_roof_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/data_types/foundation_type.dart';
import 'package:bl_demolition_materials/src/data_types/garage_wall_material.dart';
import 'package:bl_demolition_materials/src/data_types/insulation_material_thickness.dart';
import 'package:bl_demolition_materials/src/data_types/roof_type_small_properties.dart';
import 'package:bl_demolition_materials/src/data_types/heating_type.dart';
import 'package:bl_demolition_materials/src/data_types/water_roof_type.dart';
import '../../utils/utils.dart';

part 'thermal_center.freezed.dart';

/// Piharakennukset ja rakenteet
/// Lämpökeskus
@freezed
abstract class ThermalCenter with _$ThermalCenter {
  const ThermalCenter._();

  const factory ThermalCenter(
      {@Default(false) propertyIsOnDistrictHeatingOrDirectElectricHeating,
      num? concreteLengthInMeters,
      num? concreteWidthInMeters,
      num? plinthHeightInMeters,
      num? wallHeightInMeters,
      GarageWallMaterial? garageWallMaterial,
      RoofTypeSmallProperties? roofType,
      WaterRoofType? waterRoofType,
      num? roofLengthInMeters,
      num? roofFlatInMeters,
      @Default(false) areRecyclable,
      HeatingType? heatingType,
      num? powerInKiloWatts,
      num? heatingMachinesPcs,
      num? waterHeatersPcs}) = _ThermalCenter;

  /// Betoniperustus ja seinät

  /// Seinäpinta-ala (m2)
  num? get wallArea {
    if (propertyIsOnDistrictHeatingOrDirectElectricHeating == true) {
      return null;
    }
    return Utils.multiplyOrNull([
      Utils.sumOrNull([concreteLengthInMeters, concreteWidthInMeters]),
      2,
      wallHeightInMeters,
    ]);
  }

  /// Ulkoseinän pintamateriaali (tonnia)
  num? get outerWallSurfaceMaterial {
    switch (garageWallMaterial) {
      case GarageWallMaterial.board:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.board20x125)
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.brick:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.steelSheet:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          BuildingBoardsAndInsulationMaterialWeights
              .steelBoardCladding06mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.concrete:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.minerite:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      default:
        return null;
    }
  }

  /// Sokkeli, betoni, tonnia
  num? get plinthConcreteTons => Utils.multiplyOrNull([
        Utils.sumOrNull([concreteLengthInMeters, concreteWidthInMeters]),
        2,
        plinthHeightInMeters,
        0.25,
        FoundationWeights.concreteKgPerCbm
      ]);

  /// Betonilaatta, tonnia
  num? get concreteTilesTons => Utils.multiplyOrNull([
        concreteLengthInMeters,
        concreteWidthInMeters,
        StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
      ]);

  /// Betoniteräs
  num? get reinforcedConcrete {
    num? sum = Utils.sumOrNull([plinthConcreteTons, concreteTilesTons]);
    return sum != null
        ? sum /
            FoundationWeights.concreteKgPerCbm *
            FoundationWeights.concreteOrSteelBlockKgPerCbm
        : null;
  }

  /// Betoni (tonnia)
  num? get concreteTons {
    if (propertyIsOnDistrictHeatingOrDirectElectricHeating == true) {
      return null;
    }
    num? sum = Utils.sumOrNull([plinthConcreteTons, concreteTilesTons]);
    return sum != null ? sum / 1000 : null;
  }

  /// Betoni teräs (tonnia)
  num? get reingforcedConcreteTons {
    if (propertyIsOnDistrictHeatingOrDirectElectricHeating == true) {
      return null;
    }
    return reinforcedConcrete != null ? reinforcedConcrete! / 1000 : null;
  }

  /// Katto

  /// Pinta-ala
  num? get roofArea {
    if (propertyIsOnDistrictHeatingOrDirectElectricHeating == true) {
      return null;
    }
    switch (roofType) {
      case RoofTypeSmallProperties.gableRoof:
        return Utils.multiplyOrNull([roofLengthInMeters, roofFlatInMeters, 2]);
      case RoofTypeSmallProperties.flatRoof:
      case RoofTypeSmallProperties.pentRoof:
        return Utils.multiplyOrNull([roofLengthInMeters, roofFlatInMeters]);
      default:
        return null;
    }
  }

  /// Puisen ristikkorakenteen paino (tonnia)
  num? get woodenRoofLatticeWeightTons {
    switch (roofType) {
      case RoofTypeSmallProperties.gableRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          WoodenRoofStructuresWeights.gableRoofWithLattice800mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case RoofTypeSmallProperties.flatRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          WoodenRoofStructuresWeights.flatRoofWithLattice800mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case RoofTypeSmallProperties.pentRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          WoodenRoofStructuresWeights.cofferedCeilingWithLattice800mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      default:
        return null;
    }
  }

  /// Aluslaudoituksen paino (tonnia)
  num? get underBoardingWeightTons {
    num? multiply = Utils.multiplyOrNull([
      roofArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Vesikatteen paino (tonnia)
  num? get waterRoofWeightTons {
    switch (waterRoofType) {
      case WaterRoofType.roofingFelt:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.roofingFeltKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case WaterRoofType.metalRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.roofSheet06mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case WaterRoofType.mineriteRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case WaterRoofType.tiledRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.roofBrickKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      default:
        return null;
    }
  }

  /// Aluskate (tonnia)
  num? get underLaymentWeightTons {
    num? multiply = Utils.multiplyOrNull([
      roofArea,
      BuildingBoardsAndInsulationMaterialWeights.underlaymentKgPerSqm
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Lämpökattila/lämmönvaihdin

  /// Kattilan tai lämmönvaihtimen paino (tonnia)
  num? get boilerOrHeatExchangerWeightTons {
    switch (heatingType) {
      case HeatingType.pelletBoiler:
        return Utils.multiplyOrNull([
          (CentralHeatingWeights.woodChipBoilerKg / 1000),
          heatingMachinesPcs
        ]);
      case HeatingType.electricBoiler:
        return Utils.multiplyOrNull([
          (CentralHeatingWeights.electricBoilerKg / 1000),
          heatingMachinesPcs
        ]);
      case HeatingType.districtHeatExchanger:
        return Utils.multiplyOrNull([
          (CentralHeatingWeights.remoteHeatChangerKg / 1000),
          heatingMachinesPcs
        ]);
      default:
        return null;
    }
  }

  /// Vesivaraajan paino (tonnia)
  num? get waterHeaterWeightTons {
    return Utils.multiplyOrNull(
        [(CentralHeatingWeights.waterHeaterKg / 1000), waterHeatersPcs]);
  }
}
