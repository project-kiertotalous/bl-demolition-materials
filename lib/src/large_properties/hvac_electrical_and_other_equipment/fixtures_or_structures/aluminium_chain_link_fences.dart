import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/fixtures_or_structures/fixtures_or_structures.dart';

/// Panssariverkko aita, alumiini korkeus 2 m
class AluminiumChainLinkFences extends FixturesOrStructures {
  const AluminiumChainLinkFences({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter => 4;
}
