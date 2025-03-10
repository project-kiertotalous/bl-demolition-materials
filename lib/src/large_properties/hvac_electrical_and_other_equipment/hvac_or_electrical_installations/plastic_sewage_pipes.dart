import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Viemäriputket, muovi DN 150
class PlasticSewagePipes extends HvacOrElectricalInstallations {
  const PlasticSewagePipes({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.sewagePipesPlasticDn150KgPerM;

  @override
  num get volume =>
      (weightKgPerMeter ?? defaultWeightKgPerMeter) /
      HvacAndElectricalInstallationsWeights.sewagePipesPlasticDn150KgPerCbm;
}
