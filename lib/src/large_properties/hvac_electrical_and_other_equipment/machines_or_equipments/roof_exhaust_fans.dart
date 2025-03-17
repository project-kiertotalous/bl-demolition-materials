import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'roof_exhaust_fans.freezed.dart';

/// Huippuimurit
@freezed
class RoofExhaustFans extends MachinesOrEquipments with _$RoofExhaustFans {
  const RoofExhaustFans._();

  const factory RoofExhaustFans({int? quantity, num? weightKgPerPiece}) =
      _RoofExhaustFans;

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.roofExhaustFansKgPerPcs;
}
