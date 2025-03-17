import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plastic_sewage_pipes.freezed.dart';

/// Viemäriputket, muovi DN 150
@freezed
class PlasticSewagePipes extends HvacOrElectricalInstallations
    with _$PlasticSewagePipes {
  const PlasticSewagePipes._();

  const factory PlasticSewagePipes({num? meters, num? weightKgPerMeter}) =
      _PlasticSewagePipes;

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.sewagePipesPlasticDn150KgPerM;

  @override
  num get volume =>
      (weightKgPerMeter ?? defaultWeightKgPerMeter) /
      HvacAndElectricalInstallationsWeights.sewagePipesPlasticDn150KgPerCbm;
}
