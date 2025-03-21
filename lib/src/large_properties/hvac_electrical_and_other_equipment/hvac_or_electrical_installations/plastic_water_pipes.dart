import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plastic_water_pipes.freezed.dart';

/// Vesiputket, muovi
@freezed
abstract class PlasticWaterPipes extends HvacOrElectricalInstallations
    with _$PlasticWaterPipes {
  const PlasticWaterPipes._();

  const factory PlasticWaterPipes({num? meters, num? weightKgPerMeter}) =
      _PlasticWaterPipes;

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.waterPipesPlasticKgPerM;

  @override
  num get volume =>
      (weightKgPerMeter ?? defaultWeightKgPerMeter) /
      HvacAndElectricalInstallationsWeights.waterPipesPlasticKgPerCbm;
}
