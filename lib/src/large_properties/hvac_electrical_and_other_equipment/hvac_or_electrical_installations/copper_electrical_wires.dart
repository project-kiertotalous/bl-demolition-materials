import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'copper_electrical_wires.freezed.dart';

/// Sähköjohdot, kupari
@freezed
class CopperElectricalWires extends HvacOrElectricalInstallations
    with _$CopperElectricalWires {
  const CopperElectricalWires._();

  const factory CopperElectricalWires({num? meters, num? weightKgPerMeter}) =
      _CopperElectricalWires;

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.electricalWiresCopperKgPerM;
}
