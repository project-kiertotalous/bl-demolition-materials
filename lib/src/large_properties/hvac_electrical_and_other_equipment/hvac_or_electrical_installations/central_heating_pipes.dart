import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Keskusämmitysputket, vesikiertoinen lämmitys (teräs)
class CentralHeatingPipes extends HvacOrElectricalInstallations {
  const CentralHeatingPipes({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter => HvacAndElectricalInstallationsWeights
      .centralHeatingPipesWaterCirculationHeatingKgPerM;
}
