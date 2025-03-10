import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

/// Sähköjakokaapit ja mittarit
class ElectricalDistributionCabinetsAndMeters extends MachinesOrEquipments {
  const ElectricalDistributionCabinetsAndMeters(
      {super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .electricalDistributionCabinetsAndMetersKgPerPcs;
}
