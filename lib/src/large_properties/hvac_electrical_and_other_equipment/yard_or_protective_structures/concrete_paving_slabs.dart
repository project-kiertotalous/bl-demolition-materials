import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/yard_or_protective_structures.dart';

import '../../../../bl_demolition_materials.dart';

/// Tippapellit ja suojapellitykset (0,8 mm teräslevy)
class ConcretePavingSlabs extends YardOrProtectiveStructures {
  const ConcretePavingSlabs({super.squareMeters, super.weightKgPerSquareMeter});

  @override
  num get defaultWeightKgPerSquareMeter =>
      YardStructureWeights.concreteYardTilesKgPerSqm;
}
