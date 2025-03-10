import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

/// Ilmastointiputket teräs DN 300
class SteelVentilationPipes300Dn extends HvacOrElectricalInstallations {
  const SteelVentilationPipes300Dn({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.steelVentilationPipes300DnKgPerM;
}
