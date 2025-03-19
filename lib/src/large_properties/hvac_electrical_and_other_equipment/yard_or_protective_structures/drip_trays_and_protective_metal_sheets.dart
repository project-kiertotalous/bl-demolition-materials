import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/yard_or_protective_structures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';

part 'drip_trays_and_protective_metal_sheets.freezed.dart';

/// Tippapellit ja suojapellitykset (0,8 mm teräslevy)
@freezed
abstract class DripTraysAndProtectiveMetalSheets
    extends YardOrProtectiveStructures
    with _$DripTraysAndProtectiveMetalSheets {
  const DripTraysAndProtectiveMetalSheets._();

  const factory DripTraysAndProtectiveMetalSheets(
      {num? squareMeters,
      num? weightKgPerSquareMeter}) = _DripTraysAndProtectiveMetalSheets;

  @override
  num get defaultWeightKgPerSquareMeter => FixturesAndStructuresWeights
      .dripTraysAndProtectiveSheeting08mmSteelDiskKgPerSqm;
}
