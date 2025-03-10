import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

/// Lämpöpatterit, sähkö
class ElectricRadiators extends MachinesOrEquipments {
  const ElectricRadiators({super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.radiatorsElectricKgPerPcs;
}
