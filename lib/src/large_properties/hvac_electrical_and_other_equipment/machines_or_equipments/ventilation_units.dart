import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

/// Ilmanvaihtokoneet
class VentilationUnits extends MachinesOrEquipments {
  const VentilationUnits({super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.ventilationUnitsKgPerPcs;
}
