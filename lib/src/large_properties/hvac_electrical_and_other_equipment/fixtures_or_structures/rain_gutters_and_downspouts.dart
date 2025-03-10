import 'fixtures_or_structures.dart';

/// Sadevesikourut ja rännit
class RainGuttersAndDownspouts extends FixturesOrStructures {
  const RainGuttersAndDownspouts({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter => 5;
}
