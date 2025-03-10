import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

/// Lämpöpatterit, vesikiertoiset
class WaterCirculatedRadiators extends MachinesOrEquipments {
  const WaterCirculatedRadiators({super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.radiatorsWaterCirculationKgPerPcs;
}
