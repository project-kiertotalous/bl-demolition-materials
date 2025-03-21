import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'central_heating_pipes.freezed.dart';

/// Keskusämmitysputket, vesikiertoinen lämmitys (teräs)
@freezed
abstract class CentralHeatingPipes extends HvacOrElectricalInstallations
    with _$CentralHeatingPipes {
  const CentralHeatingPipes._();

  const factory CentralHeatingPipes({num? meters, num? weightKgPerMeter}) =
      _CentralHeatingPipes;

  @override
  num get defaultWeightKgPerMeter => HvacAndElectricalInstallationsWeights
      .centralHeatingPipesWaterCirculationHeatingKgPerM;
}
