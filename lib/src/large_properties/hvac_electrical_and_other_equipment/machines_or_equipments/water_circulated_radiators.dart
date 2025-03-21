import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_circulated_radiators.freezed.dart';

/// Lämpöpatterit, vesikiertoiset
@freezed
abstract class WaterCirculatedRadiators extends MachinesOrEquipments
    with _$WaterCirculatedRadiators {
  const WaterCirculatedRadiators._();

  const factory WaterCirculatedRadiators(
      {int? quantity, num? weightKgPerPiece}) = _WaterCirculatedRadiators;

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.radiatorsWaterCirculationKgPerPcs;
}
