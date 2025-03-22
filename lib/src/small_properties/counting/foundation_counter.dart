import 'package:bl_demolition_materials/src/small_properties/foundations_and_outer_shell/foundations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bl_demolition_materials/src/small_properties/material_weight.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';

part 'foundation_counter.freezed.dart';

/// Laskenta
/// Perustus

@freezed
class FoundationCounter with _$FoundationCounter {
  FoundationCounter._();

  const factory FoundationCounter({
    required Foundation foundation,
  }) = _FoundationCounter;

  /// Betoniperustus (tonnia)
  num? get concreteFoundationTons => Foundation().concreteTons;

  /// Betoni, puhdas (tonnia)
  num? get cleanConcreteTons {
    if (Foundation().containsAsbestos || Foundation().containsPcbPaints) {
      return 0;
    }
    return Foundation().concreteTons;
  }

  /// No explanation for this value
  num? get nextToCleanConcreteTons {
    if (Utils.sumOrNull(
            [reinforcedConcreteAsbestos, reinforcedConcretePcbPaints]) ==
        0) {
      return 1;
    }
    return 0;
  }

  /// Betoni, teräs (tonnia)
  num? get reinforcedConcreteTons {
    num? multiply = Utils.multiplyOrNull([
      FoundationWeights.concreteOrSteelBlockKgPerCbm,
      Foundation().reinforcedConcreteTons
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Asbestia
  num? get reinforcedConcreteAsbestos {
    if (Foundation().containsAsbestos) {
      return concreteFoundationTons;
    }
    return 0;
  }

  /// PCB:tä
  num? get reinforcedConcretePcbPaints {
    if (Foundation().containsPcbPaints) {
      return concreteFoundationTons;
    }
    return 0;
  }

  /// No explanation for this value
  num? get nextToReinforcedConcretePcbPaints {
    if (Utils.sumOrNull(
            [reinforcedConcreteAsbestos, reinforcedConcretePcbPaints]) ==
        Utils.multiplyOrNull([concreteFoundationTons, 2])) {
      return 0;
    }
    return 1;
  }
}
