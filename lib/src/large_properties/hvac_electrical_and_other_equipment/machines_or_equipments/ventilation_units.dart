import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventilation_units.freezed.dart';

/// Ilmanvaihtokoneet
@freezed
abstract class VentilationUnits extends MachinesOrEquipments with _$VentilationUnits {
  const VentilationUnits._();

  const factory VentilationUnits({int? quantity, num? weightKgPerPiece}) =
      _VentilationUnits;

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.ventilationUnitsKgPerPcs;
}
