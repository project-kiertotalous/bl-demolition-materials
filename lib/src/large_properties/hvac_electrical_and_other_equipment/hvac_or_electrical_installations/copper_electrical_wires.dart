import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Sähköjohdot, kupari
class CopperElectricalWires extends HvacOrElectricalInstallations {
  const CopperElectricalWires({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.electricalWiresCopperKgPerM;
}
