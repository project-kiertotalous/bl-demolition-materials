import 'package:freezed_annotation/freezed_annotation.dart';

import 'fixtures_or_structures/exports.dart';

part 'fixtures_and_structures.freezed.dart';

/// 14. RAKENNUKSEEN LIITTYVÄT KIINTOKALUSTEET JA RAKENTEET
@freezed
abstract class FixturesAndStructures with _$FixturesAndStructures {
  const factory FixturesAndStructures(
      {RainGuttersAndDownspouts? rainGuttersAndDownSpouts,
      FireLaddersAndWalkways? fireLaddersAndWalkways,
      AluminiumChainLinkFences? aluminiumChainLinkFences,
      SteelChainLinkFences? steelChainLinkFences,
      @Default(false) fixturesRecyclable}) = _FixturesAndStructures;
}
