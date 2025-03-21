import 'package:freezed_annotation/freezed_annotation.dart';

part 'waste_law_demolition_material_estimate_entry.freezed.dart';

@freezed
abstract class WasteLawDemolitionMaterialEstimateEntry
    with _$WasteLawDemolitionMaterialEstimateEntry {
  const factory WasteLawDemolitionMaterialEstimateEntry(
      {num? volume,
      num? tons,
      String? notes}) = _WasteLawDemolitionMaterialEstimateEntry;
}
