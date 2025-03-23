import 'package:freezed_annotation/freezed_annotation.dart';

import 'fixtures_or_structures.dart';

part 'aluminium_chain_link_fences.freezed.dart';

/// Panssariverkko aita, alumiini korkeus 2 m
@freezed
abstract class AluminiumChainLinkFences extends FixturesOrStructures
    with _$AluminiumChainLinkFences {
  const AluminiumChainLinkFences._();

  const factory AluminiumChainLinkFences({num? meters, num? weightKgPerMeter}) =
      _AluminiumChainLinkFences;

  @override
  num get defaultWeightKgPerMeter => 4;
}
