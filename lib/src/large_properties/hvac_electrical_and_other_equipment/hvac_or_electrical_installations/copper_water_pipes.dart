import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Vesiputket, kupari
class CopperWaterPipes extends HvacOrElectricalInstallations {
  const CopperWaterPipes({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.waterPipesCopperKgPerM;
}
