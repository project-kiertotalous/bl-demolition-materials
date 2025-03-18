import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'steel_ventilation_pipes_300_dn.freezed.dart';

/// Ilmastointiputket teräs DN 300
@freezed
abstract class SteelVentilationPipes300Dn extends HvacOrElectricalInstallations
    with _$SteelVentilationPipes300Dn {
  const SteelVentilationPipes300Dn._();

  const factory SteelVentilationPipes300Dn(
      {num? meters, num? weightKgPerMeter}) = _SteelVentilationPipes300Dn;

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.steelVentilationPipes300DnKgPerM;
}
