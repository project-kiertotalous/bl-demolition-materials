import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

/// Huippuimurit
class RoofExhaustFans extends MachinesOrEquipments {
  const RoofExhaustFans({super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.roofExhaustFansKgPerPcs;
}
