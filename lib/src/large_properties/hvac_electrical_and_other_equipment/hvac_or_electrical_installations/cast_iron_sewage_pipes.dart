import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

part 'cast_iron_sewage_pipes.freezed.dart';

/// Viemäriputket, valurauta DN 150
@freezed
abstract class CastIronSewagePipes extends HvacOrElectricalInstallations
    with _$CastIronSewagePipes {
  const CastIronSewagePipes._();

  const factory CastIronSewagePipes({num? meters, num? weightKgPerMeter}) =
      _CastIronSewagePipes;

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.sewagePipesCastIronDn150KgPerM;
}
