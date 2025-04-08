import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../..//utils/utils.dart';

part 'small_properties_excavation_area.freezed.dart';

/// Poistettavat maa-ainekset, poistettava alue ja määrä
@freezed
abstract class SmallPropertiesExcavationArea with _$SmallPropertiesExcavationArea {
  SmallPropertiesExcavationArea._();

  factory SmallPropertiesExcavationArea({
    num? areOfTheRemovableSoil,
    num? depthInMeters,
    num? asphaltAreaInSquareMeters,
  }) = _SmallPropertiesExcavationArea;

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
  num? get removableCleanSoilInPercents => 1;

  /// Poistettavasta maasta saastunutta (%)
  num? get contaminatedSoil => 1 - removableCleanSoilInPercents!;

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
