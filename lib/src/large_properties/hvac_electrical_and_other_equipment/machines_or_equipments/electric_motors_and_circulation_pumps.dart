import 'package:bl_demolition_materials/bl_demolition_materials.dart';

import 'machines_or_equipments.dart';

/// Sähkömoottorit ja kiertovesipumput
class ElectricMotorsAndCirculationPumps extends MachinesOrEquipments {
  const ElectricMotorsAndCirculationPumps(
      {super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .electricMotorsAndCirculationPumpsKgPerPcs;
}
