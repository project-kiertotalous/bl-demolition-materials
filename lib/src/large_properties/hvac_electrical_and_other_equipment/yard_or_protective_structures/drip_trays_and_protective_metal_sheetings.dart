import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/yard_or_protective_structures.dart';

/// Tippapellit ja suojapellitykset (0,8 mm teräslevy)
class DripTraysAndProtectiveMetalSheets extends YardOrProtectiveStructures {
  const DripTraysAndProtectiveMetalSheets(
      {super.squareMeters, super.weightKgPerSquareMeter});

  @override
  num get defaultWeightKgPerSquareMeter =>
      FixturesAndStructuresWeights
          .dripTraysAndProtectiveSheeting08mmSteelDiskKgPerSqm;
}
