import 'package:freezed_annotation/freezed_annotation.dart';
import '../data_types/fences_between_apartments.dart';
import '../material_info.dart';
import '../../utils/utils.dart';

part 'machinery_equipment_and_fixed_structures.freezed.dart';

/// Koneet, laitteet ja kiinteät rakenteet
@freezed
abstract class MachineryEquipmentAndFixedStructures
    with _$MachineryEquipmentAndFixedStructures {
  const MachineryEquipmentAndFixedStructures._();

  const factory MachineryEquipmentAndFixedStructures({
    @Default(false) bool areElectricMotorsRecyclable,
    @Default(false) bool areVentilationMachinesRecyclable,
    num? electricMotors,
    num? ventilationMachines,
    num? electricalDistributionMachinesAndMeters,
    num? waterCirculationRadiators,
    @Default(false) bool areConcreteYardTilesAndWallStonesRecyclable,
    FencesBetweenApartments? fencesBetweenApartments,
    num? concreteYardTilesAndStonesInSquareMeters,
    num? fencesBetweenApartmentsInMeters,
  }) = _MachineryEquipmentAndFixedStructures;

  /// Sähkömoottorit (kg)
  num? get electricMotorsWeightKg => Utils.multiplyOrNull([
        electricMotors,
        FurnitureDressingKitchenToiletSpaceWeights.electricEngineKgPerPcs
      ]);

  /// Ilmanvaihtokoneet (kg)
  /// This calculation counts wrong, it directs to wrong value in the original excel file
  num? get ventilationMachinesWeightKg => Utils.multiplyOrNull([
        ventilationMachines,
        FurnitureDressingKitchenToiletSpaceWeights.electricCentralKgPerPcs
      ]);

  /// Sähköjakokaapit ja mittarit (kg)
  num? get electricalDistributionMachinesAndMetersWeightKg =>
      Utils.multiplyOrNull([
        electricalDistributionMachinesAndMeters,
        FurnitureDressingKitchenToiletSpaceWeights.electricCentralKgPerPcs
      ]);

  /// Vesikiertoiset lämpöpatterit (kg)
  num? get waterCirculationRadiatorsWeightKg => Utils.multiplyOrNull([
        waterCirculationRadiators,
        FurnitureDressingKitchenToiletSpaceWeights
            .centralHeatingRadiatorsWaterCirculatinKgPerPcs
      ]);

  /// Betoniset pihalaatoitukset ja muurikivet (tonnia)
  num? get concreteYardTilesAndStonesWeightTons {
    num? multiply = Utils.multiplyOrNull([
      concreteYardTilesAndStonesInSquareMeters,
      YardStructureWeights.concreteYardTilesAndStonesKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Huoneistojen väliset aidat (tonnia)
  num? get fencesBetweenApartmentsWeightTons {
    if (fencesBetweenApartments == FencesBetweenApartments.woodenFence) {
      num? multiply = Utils.multiplyOrNull([
        fencesBetweenApartmentsInMeters,
        YardStructureWeights.woodenFencesHeight1_2mKgPerM
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    } else if (fencesBetweenApartments ==
        FencesBetweenApartments.steelMeshFence) {
      num? multiply = Utils.multiplyOrNull([
        fencesBetweenApartmentsInMeters,
        YardStructureWeights.steelMeshFencesHeight1_2mKgPerM
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    } else if (fencesBetweenApartments ==
        FencesBetweenApartments.aluminiumMeshFence) {
      num? multiply = Utils.multiplyOrNull([
        fencesBetweenApartmentsInMeters,
        YardStructureWeights.aluminiumMeshFencesHeight1_2mKgPerM
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    }
    return null;
  }

  /// Next calculations are from Laskenta tab

  /// Sähkömoottorit (tonnia)
  /// This calculation counts counts wrong, it multiplies the number of electric motors with the weight of electric motors which has already been multiplied
  num? get electricMotorsWeightTons {
    num? multiply =
        Utils.multiplyOrNull([electricMotors, electricMotorsWeightKg]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Ilmanvaihtokoneet (tonnia)
  /// Same problem here
  num? get ventilationMachinesWeightTons {
    num? multiply = Utils.multiplyOrNull(
        [ventilationMachines, ventilationMachinesWeightKg]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Lämpöpatterit vesikiertoiset (tonnia)
  num? get waterCirculationRadiatorsWeightTons {
    if (waterCirculationRadiators == null) {
      return null;
    }
    return waterCirculationRadiatorsWeightKg! / 1000;
  }

  num? get recyclableYardTiles {
    if (areConcreteYardTilesAndWallStonesRecyclable) {
      return concreteYardTilesAndStonesWeightTons;
    }
    return null;
  }
}
