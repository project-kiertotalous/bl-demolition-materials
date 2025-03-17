import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/hvac_or_electrical_installations/exports.dart';

import '../../../../bl_demolition_materials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_iron_sewage_pipes.freezed.dart';

/// Viemäriputket, valurauta DN 150
@freezed
class CastIronSewagePipes extends HvacOrElectricalInstallations
    with _$CastIronSewagePipes {
  const CastIronSewagePipes._();

  const factory CastIronSewagePipes({num? meters, num? weightKgPerMeter}) =
      _CastIronSewagePipes;

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.sewagePipesCastIronDn150KgPerM;
}
