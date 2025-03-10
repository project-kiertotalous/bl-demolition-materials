import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

/// Vesivaraajat, suuret (sähkö, kaukolämpö 500-1000l)
class LargeElectricalWaterAccumulators extends MachinesOrEquipments {
  const LargeElectricalWaterAccumulators(
      {super.quantity, super.weightKgPerPiece});

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .waterAccumulatorsElectricBigDistrictHeating500To1000LitersKgPerPcs;
}
