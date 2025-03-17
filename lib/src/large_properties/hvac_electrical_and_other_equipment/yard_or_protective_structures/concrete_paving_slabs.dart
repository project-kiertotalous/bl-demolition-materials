import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/yard_or_protective_structures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';

part 'concrete_paving_slabs.freezed.dart';

/// Tippapellit ja suojapellitykset (0,8 mm teräslevy)
@freezed
class ConcretePavingSlabs extends YardOrProtectiveStructures
    with _$ConcretePavingSlabs {
  const ConcretePavingSlabs._();

  const factory ConcretePavingSlabs(
      {num? squareMeters, num? weightKgPerSquareMeter}) = _ConcretePavingSlabs;

  @override
  num get defaultWeightKgPerSquareMeter =>
      YardStructureWeights.concreteYardTilesKgPerSqm;
}
