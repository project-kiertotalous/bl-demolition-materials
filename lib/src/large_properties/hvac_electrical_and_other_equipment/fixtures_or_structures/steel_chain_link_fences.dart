import 'fixtures_or_structures.dart';

/// Panssariverkko aita, alumiini korkeus 2 m
class SteelChainLinkFences extends FixturesOrStructures {
  const SteelChainLinkFences({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter => 5;
}
