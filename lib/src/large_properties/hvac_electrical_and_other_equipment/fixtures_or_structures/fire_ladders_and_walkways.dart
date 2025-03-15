import 'fixtures_or_structures.dart';

/// Palotikkaat ja kulkusillat
class FireLaddersAndWalkways extends FixturesOrStructures {
  const FireLaddersAndWalkways({super.meters, super.weightKgPerMeter});

  @override
  num get defaultWeightKgPerMeter => 10;
}
