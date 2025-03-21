import 'fixtures_or_structures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rain_gutters_and_downspouts.freezed.dart';

/// Sadevesikourut ja rännit
@freezed
abstract class RainGuttersAndDownspouts extends FixturesOrStructures
    with _$RainGuttersAndDownspouts {
  const RainGuttersAndDownspouts._();

  const factory RainGuttersAndDownspouts({num? meters, num? weightKgPerMeter}) =
      _RainGuttersAndDownspouts;

  @override
  num get defaultWeightKgPerMeter => 5;
}
