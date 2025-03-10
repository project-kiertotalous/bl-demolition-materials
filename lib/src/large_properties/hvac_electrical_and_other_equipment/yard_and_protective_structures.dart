import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/concrete_paving_slabs.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/drip_trays_and_protective_metal_sheetings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'yard_and_protective_structures.freezed.dart';

/// 15. PIHA JA SUOJARAKENTEET
@freezed
class YardAndProtectiveStructures with _$YardAndProtectiveStructures {
  const factory YardAndProtectiveStructures(
      {DripTraysAndProtectiveMetalSheets? dripTraysAndProtectiveMetalSheets,
      ConcretePavingSlabs? concretePavingSlabs}) = _YardAndProtectiveStructures;
}
