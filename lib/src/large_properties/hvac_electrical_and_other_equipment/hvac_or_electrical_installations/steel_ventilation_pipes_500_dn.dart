import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Ilmastointiputket teräs DN 500
class SteelVentilationPipes500Dn extends HvacOrElectricalInstallations {
  const SteelVentilationPipes500Dn({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.steelVentilationPipes500DnKgPerM;
}
