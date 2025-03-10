import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Vesiputket, muovi
class PlasticWaterPipes extends HvacOrElectricalInstallations {
  const PlasticWaterPipes({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.waterPipesPlasticKgPerM;

  @override
  num get volume =>
      (weightKgPerMeter ?? defaultWeightKgPerMeter) /
      HvacAndElectricalInstallationsWeights.waterPipesPlasticKgPerCbm;
}
