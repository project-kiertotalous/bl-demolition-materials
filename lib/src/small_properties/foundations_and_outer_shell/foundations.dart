import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../..//utils/utils.dart';

part 'foundations.freezed.dart';

/// Poistettavat maa-ainekset, poistettava alue ja määrä
@freezed
abstract class ExcavationAreaSmallProperties
    with _$ExcavationAreaSmallProperties {
  ExcavationAreaSmallProperties._();

  factory ExcavationAreaSmallProperties({
    num? areOfTheRemovableSoil,
    num? depthInMeters,
    num? asphaltAreaInSquareMeters,
  }) = _ExcavationAreaSmallProperties;

  /// Poistettava määrä (m3)
  num? get soilToBeRemovedVolume =>
      Utils.multiplyOrNull([areOfTheRemovableSoil, depthInMeters]);

  /// Poistettava maa (yhteensä, tonnia)
  num? get soilToBeRemovedTons {
    num? multiply = Utils.multiplyOrNull(
        [soilToBeRemovedVolume, FoundationWeights.removableSoilKgPerCbm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Poistettava puhdas maa (%)
  num? get removableCleanSoilPercentage => 1;

  /// Poistettavasta maasta saastunutta (%)
  num? get contaminatedSoil => 1 - removableCleanSoilPercentage!;

  // Asfaltti (tonnia)
  num? get asphaltTons {
    num? multiply = Utils.multiplyOrNull(
        [asphaltAreaInSquareMeters, FoundationWeights.asphaltKgPerSqm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}

/// Perustus
@freezed
abstract class Foundation with _$Foundation {
  Foundation._();

  factory SmallPropertiesFoundation({
    @Default(false) bool containsAsbestos,
    @Default(false) bool containsPcbPaints,
    num? plinthLengthInLinearMeters,
    num? plinthThicknessInMeters,
    num? concreteSlabAreaInSquareMeters,
    num? plinthHeightInMeters,
    num? concreteSlabThicknessInMeters,
  }) = _SmallPropertiesFoundation;

  /// Betoni (m3)
  num? get concreteVolume => Utils.sumOrNull([
        Utils.multiplyOrNull([
          plinthLengthInLinearMeters,
          plinthThicknessInMeters,
          plinthHeightInMeters
        ]),
        Utils.multiplyOrNull(
            [concreteSlabAreaInSquareMeters, concreteSlabThicknessInMeters])
      ]);

  /// Also in Laskenta tab, betoniperustus
  /// Betoni (tonnia)
  num? get concreteTons {
    num? multiply = Utils.multiplyOrNull(
        [concreteVolume, FoundationWeights.concreteKgPerCbm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Betoni teräs (tonnia)
  num? get reinforcedConcreteTons {
    num? multiply = Utils.multiplyOrNull(
        [concreteVolume, FoundationWeights.concreteOrSteelBlockKgPerCbm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// The rest of the code is from Laskenta-tab in the Excel sheet.
  /// Laskenta
  /// Perustus

  /// Betoni, puhdas (tonnia)
  num? get cleanConcreteTons {
    if (containsAsbestos || containsPcbPaints) {
      return null;
    }
    return concreteTons;
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
  num? get reinforcedConcreteTonsForCounter {
    num? multiply = Utils.multiplyOrNull([
      FoundationWeights.concreteOrSteelBlockKgPerCbm,
      reinforcedConcreteTons
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Asbestia
  num? get reinforcedConcreteAsbestos {
    if (containsAsbestos) {
      return concreteTons;
    }
    return 0;
  }

  /// PCB:tä
  num? get reinforcedConcretePcbPaints {
    if (containsPcbPaints) {
      return concreteTons;
    }
    return 0;
  }

  /// No explanation for this value
  num? get nextToReinforcedConcretePcbPaints {
    if (Utils.sumOrNull(
            [reinforcedConcreteAsbestos, reinforcedConcretePcbPaints]) ==
        Utils.multiplyOrNull([concreteTons, 2])) {
      return 0;
    }
    return 1;
  }
}
