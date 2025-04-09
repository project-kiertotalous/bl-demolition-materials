import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_properties_reusable_and_recyclable_materials.freezed.dart';

/// HYÖDYNTÄMISKELPOISET JA KIERRÄTETTÄVÄT MATERIAALIT
@freezed
abstract class SmallPropertiesReusableAndRecyclableMaterials
    with _$SmallPropertiesReusableAndRecyclableMaterials {
  SmallPropertiesReusableAndRecyclableMaterials._();

  factory SmallPropertiesReusableAndRecyclableMaterials(
          {num? cleanSoilDemolitionCost,
          num? asphaltWasteDemolitionCost,
          num? cleanConcreteDemolitionCost,
          num? reinforcedConcreteSheetMetalRoofAndMoreDemolitionCost,
          num? wallAndCeilingTilesDemolitionCost,
          num? cleanReusableWoodDemolitionCost,
          num? burnableWoodWasteDemolitionCost,
          num? windProtectionSheetBitumenOrSimilarDemolitionCost,
          num? glassAndMineralInsulationWoolDemolitionCost,
          num? cybrocSheetsDemolitionCost,
          num? chipboardDemolitionCost,
          num? energyWastePaintedWoodRoofingFeltAndUnderLaymentDemolitionCost,
          num? glassDemolitionCost,
          num? aluminiumDemolitionCost,
          num? otherMetalScrapDemolitionCost,
          num? stainlessSteelDemolitionCost,
          num? copperDemolitionCost,
          num? concreteYardTilesAndStonesDemolitionCost,
          num? overallReusableMaterialsDemolitionCost}) =
      _SmallPropertiesReusableAndRecyclableMaterials;
}
