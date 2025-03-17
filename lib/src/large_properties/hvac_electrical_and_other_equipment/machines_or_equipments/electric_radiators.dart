import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'electric_radiators.freezed.dart';

/// Lämpöpatterit, sähkö
@freezed
class ElectricRadiators extends MachinesOrEquipments with _$ElectricRadiators {
  const ElectricRadiators._();

  const factory ElectricRadiators({int? quantity, num? weightKgPerPiece}) =
      _ElectricRadiators;

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.radiatorsElectricKgPerPcs;
}
