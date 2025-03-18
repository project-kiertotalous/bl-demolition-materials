import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'electrical_distribution_cabinets_and_meters.freezed.dart';

/// Sähköjakokaapit ja mittarit
@freezed
abstract class ElectricalDistributionCabinetsAndMeters extends MachinesOrEquipments
    with _$ElectricalDistributionCabinetsAndMeters {
  const ElectricalDistributionCabinetsAndMeters._();

  const factory ElectricalDistributionCabinetsAndMeters(
      {int? quantity,
      num? weightKgPerPiece}) = _ElectricalDistributionCabinetsAndMeters;

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .electricalDistributionCabinetsAndMetersKgPerPcs;
}
