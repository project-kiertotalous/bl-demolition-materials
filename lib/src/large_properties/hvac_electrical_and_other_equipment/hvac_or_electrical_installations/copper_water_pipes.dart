import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'copper_water_pipes.freezed.dart';

/// Vesiputket, kupari
@freezed
abstract class CopperWaterPipes extends HvacOrElectricalInstallations
    with _$CopperWaterPipes {
  const CopperWaterPipes._();

  const factory CopperWaterPipes({num? meters, num? weightKgPerMeter}) =
      _CopperWaterPipes;

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.waterPipesCopperKgPerM;
}
