import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Viemäriputket, valurauta DN 150
class CastIronSewagePipes extends HvacOrElectricalInstallations {
  const CastIronSewagePipes({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.sewagePipesCastIronDn150KgPerM;
}
