import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

/// Vesivaraajat (sähkö, pienet)
class SmallElectricalWaterAccumulators extends MachinesOrEquipments {
  const SmallElectricalWaterAccumulators(
      {super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .waterAccumulatorsElectricSmallKgPerPcs;
}
