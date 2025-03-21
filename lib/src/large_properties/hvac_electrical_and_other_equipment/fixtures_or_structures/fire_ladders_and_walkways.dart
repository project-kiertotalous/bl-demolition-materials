import 'fixtures_or_structures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_ladders_and_walkways.freezed.dart';

/// Palotikkaat ja kulkusillat
@freezed
abstract class FireLaddersAndWalkways extends FixturesOrStructures
    with _$FireLaddersAndWalkways {
  const FireLaddersAndWalkways._();

  const factory FireLaddersAndWalkways({num? meters, num? weightKgPerMeter}) =
      _FireLaddersAndWalkways;

  @override
  num get defaultWeightKgPerMeter => 10;
}
