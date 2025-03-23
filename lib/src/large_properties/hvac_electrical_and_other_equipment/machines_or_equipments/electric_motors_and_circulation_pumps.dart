import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'electric_motors_and_circulation_pumps.freezed.dart';

/// Sähkömoottorit ja kiertovesipumput
@freezed
abstract class ElectricMotorsAndCirculationPumps extends MachinesOrEquipments
    with _$ElectricMotorsAndCirculationPumps {
  const ElectricMotorsAndCirculationPumps._();

  const factory ElectricMotorsAndCirculationPumps(
      {int? quantity,
      num? weightKgPerPiece}) = _ElectricMotorsAndCirculationPumps;

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .electricMotorsAndCirculationPumpsKgPerPcs;
}
