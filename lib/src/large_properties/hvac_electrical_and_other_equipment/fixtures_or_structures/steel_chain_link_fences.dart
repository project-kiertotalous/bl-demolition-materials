import 'fixtures_or_structures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'steel_chain_link_fences.freezed.dart';

/// Panssariverkko aita, alumiini korkeus 2 m
@freezed
class SteelChainLinkFences extends FixturesOrStructures
    with _$SteelChainLinkFences {
  const SteelChainLinkFences._();

  const factory SteelChainLinkFences({num? meters, num? weightKgPerMeter}) =
      _SteelChainLinkFences;

  @override
  num get defaultWeightKgPerMeter => 5;
}
