import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import 'exports.dart';

part 'demolition_waste_and_costs.freezed.dart';

/// Purkujätteet ja kustannukset
@freezed
abstract class DemolitionWasteAndCosts with _$DemolitionWasteAndCosts {
  DemolitionWasteAndCosts._();

  factory DemolitionWasteAndCosts(
      {num? demolitionCostPerTon,
      ReusableAndRecyclableMaterials? reusableAndRecyclableMaterials,
      RecyclableComponentsAndFurniture? recyclableComponentsAndFurniture,
      DisposalMaterialsAndHazardousWaste? disposalMaterialsAndHazardousWaste,
      TotalBuildingDimensions?
          totalBuildingDimensions}) = _DemolitionWasteAndCosts;

  /// Kokonaispurkujätemäärä (tilavuus)
  num? get totalVolume => Utils.sumOrNull([
        reusableAndRecyclableMaterials?.totalVolume,
        recyclableComponentsAndFurniture?.totalVolume,
        disposalMaterialsAndHazardousWaste?.totalVolume
      ]);

  /// Kokonaispurkujätemäärä (tonnit)
  num? get totalTons => Utils.sumOrNull([
        reusableAndRecyclableMaterials?.totalTons,
        recyclableComponentsAndFurniture?.totalTons,
        disposalMaterialsAndHazardousWaste?.totalTons
      ]);

  /// Rakennuksen purkujätemäärä (ei sisällä poistettavaa maata) (tilavuus)
  num? get totalVolumeExcludingExcavatedLand => totalVolume == null
      ? null
      : totalVolume! - (reusableAndRecyclableMaterials?.cleanSoil.volume ?? 0);

  /// Rakennuksen purkujätemäärä (ei sisällä poistettavaa maata) (tonnit)
  num? get totalTonsExcludingExcavatedLand => totalTons == null
      ? null
      : totalTons! - (reusableAndRecyclableMaterials?.cleanSoil.tons ?? 0);

  /// Purettavan rakennuksen kerrosala (m2)
  num? get buildingGrossFloorArea => totalBuildingDimensions?.grossFloorArea;

  /// Purettavan rakennuksen tilavuus (m3)
  num? get buildingVolume => totalBuildingDimensions?.volume;

  /// Purkumateriaalien mukaan laskettu purkukustannus (€/tonni)
  num? get demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials {
    if (Utils.anyNull([
      reusableAndRecyclableMaterials?.totalBatchPrice,
      disposalMaterialsAndHazardousWaste?.totalBatchPrice,
      totalVolume
    ])) {
      return 0;
    }

    return (reusableAndRecyclableMaterials!.totalBatchPrice! +
            disposalMaterialsAndHazardousWaste!.totalBatchPrice!) /
        totalVolume!;
  }

  /// Purkukustannus arvio (€)
  num? get estimatedDemolitionCost {
    if (demolitionCostPerTon != null) {
      if (totalTons == null) {
        return 0;
      }

      return demolitionCostPerTon! * totalTons!;
    }

    if (demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials == null ||
        totalVolume == null) {
      return 0;
    }

    return demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials! *
        totalVolume!;
  }

  /// Rakennuksen purkustannus (ei sisällä maanpoistoa)
  num? get estimatedDemolitionCostExcludingExcavations {
    if (demolitionCostPerTon != null) {
      if (totalTonsExcludingExcavatedLand == null) {
        return 0;
      }

      return demolitionCostPerTon! * totalTonsExcludingExcavatedLand!;
    }

    if (demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials == null ||
        totalVolumeExcludingExcavatedLand == null) {
      return 0;
    }

    return demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials! *
        totalVolumeExcludingExcavatedLand!;
  }

  /// Purkukustannus/neliö (€/m2)
  num? get demolitionCostPerSquareMeter =>
      estimatedDemolitionCost == null || buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCost! / buildingGrossFloorArea!;

  /// Purkukustannus/neliö, ei sisällä maanpoistoa (€/m2)
  num? get demolitionCostPerSquareMeterExcludingExcavations =>
      estimatedDemolitionCostExcludingExcavations == null ||
              buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCostExcludingExcavations! /
              buildingGrossFloorArea!;

  /// Purkukustannus/rakennuskuutio (€/m3)
  num? get demolitionCostPerCubicMeter =>
      estimatedDemolitionCost == null || buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCost! / buildingVolume!;

  /// Purkukustannus/rakennuskuutio, ei sisällä maanpoistoa (€/m3)
  num? get demolitionCostPerCubicMeterExcludingExcavations =>
      estimatedDemolitionCostExcludingExcavations == null ||
              buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCostExcludingExcavations! / buildingVolume!;

  /// Myytävät materiaalierät (€)
  num? get sellableMaterialBatchesPrice => Utils.sumOrNull([
        reusableAndRecyclableMaterials?.totalBatchPrice,
        recyclableComponentsAndFurniture?.totalBatchPrice
      ]);
}
